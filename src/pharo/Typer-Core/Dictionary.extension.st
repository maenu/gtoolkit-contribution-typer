Extension { #name : #Dictionary }

{ #category : #'*Typer-Core' }
Dictionary >> typAsTypeVariableBindings [
	| bindings |
	bindings := TypTypeVariableBindings new.
	self keysAndValuesDo: [ :k :v | bindings at: k put: v ].
	^ bindings
]

{ #category : #'*Typer-Core' }
Dictionary >> typSelfType [
	| type |
	type := super typSelfType.
	(type isParametric and: [ type parameters size = 2 ])
		ifTrue: [ | types |
			type := type copy.
			"infer parametric type from elements, using only generic types to avoid infinite loop"
			types := (self typSelfTypeSamples
				inject:
					(OrderedCollection
						with: OrderedCollection new
						with: OrderedCollection new)
				into: [ :s :e | 
					(s at: 1) add: e key class typAsType.
					(s at: 2) add: e value class typAsType.
					s ]) collect: #typAsType.
			type := type
				copyWithBindings:
					{((type parameters at: 1) -> (types at: 2)).
					((type parameters at: 2) -> (types at: 1))} asOrderedDictionary ].
	^ type
]

{ #category : #'*Typer-Core' }
Dictionary >> typSelfTypeSamples [
	^ self size > 100
		ifTrue: [ self associations asOrderedCollection copyFrom: 1 to: 100 ]
		ifFalse: [ self associations ]
]
