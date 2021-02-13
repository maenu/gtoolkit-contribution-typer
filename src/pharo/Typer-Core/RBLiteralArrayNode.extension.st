Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Core' }
RBLiteralArrayNode >> typTypeRecursive [
	| type |
	type := Array typAsType.
	(type isParametric and: [ type parameters size = 1 ])
		ifTrue: [ type := type
				copyWithParameters:
					{((type parameters at: 1)
						-> (self contents collect: [ :e | e typType ]) typAsType)} asDictionary ].
	^ type
]
