Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Core' }
RBLiteralArrayNode >> typTypeRecursive [
	| type |
	type := Array typAsType.
	(type isParametric and: [ type parameters size = 1 ])
		ifTrue: [ type := type
				copyWithBindings:
					{((type parameters at: 1)
						-> (self contents collect: #typType) typAsType)}
						asOrderedDictionary ].
	^ type
]
