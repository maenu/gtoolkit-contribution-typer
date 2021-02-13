Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Core' }
RBProgramNode >> typAnnotateType: aType [
	"Annotates aType according to my comments used for casting and setting parameters."
	
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := aType.
	self comments
		detect: #typIsCastAs
		ifFound: [ :e | type := e typCastAs ].
	self comments
		detect: #typIsParameters
		ifFound: [ :e | 
			type isParametric
				ifTrue: [ | type_ bindings |
					type_ := type "typCastAs TypParametricType".
					bindings := e typParameters.
					bindings size = type_ parameters size
						ifTrue: [ type := type_
								copyWithParameters:
									(type_ parameters withIndexCollect: [ :f :i | f -> (bindings at: i) ])
										asDictionary ]
						ifFalse: [ self flag: 'log or do nothing?' ] ]
				ifFalse: [ self flag: 'log or do nothing?' ] ].
	^ type
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typInvokedMethods [
	^ self children
		inject: Set new
		into: [ :s :e | 
			s
				addAll: e typInvokedMethods;
				yourself ]
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typSignalsAlways [
	<typTypeResultAs: '{!,Boolean}'>
	^ false
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typType [
	<typTypeResultAs: 'TypType'>
	| key |
	key := #typType.
	^ (self
		propertyAt: key
		ifAbsent: [ "need to set property to default to unknown on recursive calls"
			self
				propertyAt: key put: (TypUnknownType instance);
				propertyAt: key
					put: (self typAnnotateType: (self typTypeRecursive)) ]) "typCastAs TypType"
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ TypUnknownType instance
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typTypeReset [
	self removeProperty: #typType ifAbsent: [  ].
	self children do: [ :e | e typTypeReset ]
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typTypeResetAll [
	properties
		ifNotNil: [ (properties keys select: [ :e | e beginsWith: #typ ])
				do: [ :e | self removeProperty: e ] ].
	self children do: #typTypeResetAll
]
