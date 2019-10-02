Extension { #name : #Association }

{ #category : #'*Typer-Core' }
Association >> typSelfType [
	| type |
	type := super typSelfType.
	(type isParametric and: [ type bindings size = 2 ])
		ifTrue: [ type := type copy.
			type bindings
				at: type bindings keys first put: key typSelfType;
				at: type bindings keys second put: value typSelfType ].
	^ type
]
