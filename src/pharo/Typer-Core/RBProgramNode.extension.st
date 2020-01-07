Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Core' }
RBProgramNode >> typAnnotateType: aType [
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
								copyWithBindings:
									(type_ parameters withIndexCollect: [ :f :i | f -> (bindings at: i) ])
										asDictionary ]
						ifFalse: [ self flag: 'log or do nothing?' ] ]
				ifFalse: [ self flag: 'log or do nothing?' ] ].
	^ type
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typInvokedMethodsIn: aContext [
	^ self children
		inject: Set new
		into: [ :s :e | 
			s
				addAll: (e typInvokedMethodsIn: aContext);
				yourself ]
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typSignalsAlwaysIn: aContext [
	<typTypeResultAs: '{!,Boolean}'>
	^ false
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typTypeIn: aContext [
	<typTypeResultAs: 'TypType'>
	| key |
	key := #typType -> aContext.
	^ (self
		propertyAt: key
		ifAbsent: [ "need to set property to default to unknown on recursive calls"
			self
				propertyAt: key put: TypUnknownType instance;
				propertyAt: key
					put: (self typAnnotateType: (self typTypeRecursiveIn: aContext)) ]) "typCastAs TypType"
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typTypeRecursiveIn: aContext [
	<typTypeResultAs: 'TypType'>
	^ TypUnknownType instance
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typTypeResetIn: aContext [
	self removeProperty: #typType -> aContext ifAbsent: [  ].
	self children do: [ :e | e typTypeResetIn: aContext ]
]
