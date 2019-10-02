Extension { #name : #Dictionary }

{ #category : #'*Typer-Core' }
Dictionary >> typSelfType [
	| type |
	type := super typSelfType.
	(type isParametric
		and: [ type parameters size = 2
				and: [ type parameters first isTypeVariable
						and: [ type parameters second isTypeVariable ] ] ])
		ifFalse: [ ^ type ].
	"infer parametric type from elements, using only generic types to avoid infinite loop"
	^ super typSelfType
		asParametricType:
			((self typSelfTypeSamples
				inject:
					(OrderedCollection
						with: OrderedCollection new
						with: OrderedCollection new)
				into: [ :s :e | 
					s first add: e key class typAsType.
					s second add: e value class typAsType.
					s ]) collect: #typAsType)
]

{ #category : #'*Typer-Core' }
Dictionary >> typSelfTypeSamples [
	^ self size > 100
		ifTrue: [ self associations asOrderedCollection copyFrom: 1 to: 100 ]
		ifFalse: [ self associations ]
]
