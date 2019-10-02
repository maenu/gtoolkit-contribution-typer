Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Core' }
RBLiteralArrayNode >> typTypeRecursive [
	| type |
	type := Array typAsType.
	(type isParametric and: [ type bindings size = 1 ])
		ifTrue: [ type := type copy.
			type bindings
				at: type bindings keys first
				put: (self contents collect: #typType) typAsType ].
	^ type
]
