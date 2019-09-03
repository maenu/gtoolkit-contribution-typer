Extension { #name : #Collection }

{ #category : #'*Typer-Dynamic' }
Collection >> typSelfType [
	| type |
	type := super typSelfType.
	(type isParametric
		and: [ type parameters size = 1 and: [ type parameters first isUnknown ] ])
		ifFalse: [ ^ type ].
	"infer parametric type from elements, using only generic types to avoid infinite loop"
	^ type
		asParametricType:
			{(self asOrderedCollection collect: [ :e | e class typAsType ])
				typAsType}
]
