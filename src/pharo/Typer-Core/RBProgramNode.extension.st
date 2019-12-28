Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Core' }
RBProgramNode >> typAnnotateType: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := aType.
	self comments
		detect: #typIsCastAs
		ifFound: [ :e | type := e typCastAs ]
		ifNone: [  ].
	self comments
		detect: #typIsParameters
		ifFound: [ :e | 
			type isParametric
				ifTrue: [ | type_ bindings |
					type_ := type "typCastAs TypParametricType".
					bindings := e typParameters.
					bindings size = type_ parameters size
						ifTrue: [ type := type_
								copyWithBindings:
									(type_ parameters withIndexCollect: [ :f :i | f -> (bindings at: i) ])
										asDictionary ]
						ifFalse: [ self flag: 'log or do nothing?' ] ]
				ifFalse: [ self flag: 'log or do nothing?' ] ]
		ifNone: [  ].
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
RBProgramNode >> typIsTyped [
	<typTypeResultAs: 'Boolean'>
	^ self hasProperty: #typType
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typSignalsAlways [
	<typTypeResultAs: '{!,Boolean}'>
	^ false
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typType [
	<typTypeResultAs: 'TypType'>
	^ (self
		propertyAt: #typType
		ifAbsent: [ "need to set property to default to unknown on recursive calls"
			self
				propertyAt: #typType put: TypUnknownType instance;
				propertyAt: #typType
					put: (self typAnnotateType: self typTypeRecursive) ]) "typCastAs TypType"
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ TypUnknownType instance
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typTypeReset [
	self removeProperty: #typType ifAbsent: [  ].
	self children do: #typTypeReset
]
