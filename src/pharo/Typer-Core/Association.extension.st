Extension { #name : #Association }

{ #category : #'*Typer-Core' }
Association >> typSelfType [
	| type |
	type := super typSelfType.
	type isParametric
		ifTrue: [ | type_ |
			type_ := type "typCastAs TypParametricType".
			type_ parameters size = 2
				ifTrue: [ type := type_
						copyWithBindings:
							{((type_ parameters at: 1) -> key typSelfType).
							((type_ parameters at: 2) -> value typSelfType)}
								typAsTypeVariableBindings ] ].
	^ type
]
