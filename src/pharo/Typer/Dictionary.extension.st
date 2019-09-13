Extension { #name : #Dictionary }

{ #category : #'*Typer' }
Dictionary >> typSelfType [
	| type |
	type := super typSelfType.
	(type isParametric
		and: [ type parameters size = 2
				and: [ type parameters first isUnknown
						and: [ type parameters second isUnknown ] ] ])
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

{ #category : #'*Typer' }
Dictionary >> typSelfTypeSamples [
	^ self size > 100
		ifTrue: [ self associations asOrderedCollection copyFrom: 1 to: 100 ]
		ifFalse: [ self associations ]
]
