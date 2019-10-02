Extension { #name : #Dictionary }

{ #category : #'*Typer-Core' }
Dictionary >> typSelfType [
	| type |
	type := super typSelfType.
	(type isParametric and: [ type bindings size = 1 ])
		ifTrue: [ | types |
			type := type copy.
			"infer parametric type from elements, using only generic types to avoid infinite loop"
			types := (self typSelfTypeSamples
				inject:
					(OrderedCollection
						with: OrderedCollection new
						with: OrderedCollection new)
				into: [ :s :e | 
					s first add: e key class typAsType.
					s second add: e value class typAsType.
					s ]) collect: #typAsType.
			type bindings
				at: type bindings keys first put: types second;
				at: type bindings keys second put: types first ].
	^ type
]

{ #category : #'*Typer-Core' }
Dictionary >> typSelfTypeSamples [
	^ self size > 100
		ifTrue: [ self associations asOrderedCollection copyFrom: 1 to: 100 ]
		ifFalse: [ self associations ]
]
