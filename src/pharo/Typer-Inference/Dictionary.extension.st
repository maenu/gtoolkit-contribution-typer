Extension { #name : #Dictionary }

{ #category : #'*Typer-Inference' }
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
				copyWithParameters:
					{(types at: 2).
					(types at: 1)} ].
	^ type
]

{ #category : #'*Typer-Inference' }
Dictionary >> typSelfTypeSamples [
	| pool |
	self size < 128
		ifTrue: [ ^ self ].
	pool := self associations copy asOrderedCollection.
	^ 128 timesCollect: [ pool remove: pool atRandom ]
]
