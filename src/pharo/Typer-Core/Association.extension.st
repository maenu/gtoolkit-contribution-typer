Extension { #name : #Association }

{ #category : #'*Typer-Core' }
Association >> typSelfType [
	| type |
	type := super typSelfType.
	(type isParametric and: [ type parameters size = 2 ])
		ifTrue: [ type := type
				copyWithBindings:
					{((type parameters at: 1) -> key typSelfType).
					((type parameters at: 2) -> value typSelfType)}
						typAsTypeVariableBindings ].
	^ type
]
