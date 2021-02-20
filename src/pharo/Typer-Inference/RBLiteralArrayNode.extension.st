Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typTypeRecursive [
	| type |
	type := Array typAsType.
	(type isParametric and: [ type parameters size = 1 ])
		ifTrue: [ type := type
				copyWithParameters: {(self contents collect: #typType) typAsType} ].
	^ type
]
