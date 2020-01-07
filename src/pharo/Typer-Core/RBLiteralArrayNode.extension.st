Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Core' }
RBLiteralArrayNode >> typTypeRecursiveIn: aContext [
	| type |
	type := Array typAsType.
	(type isParametric and: [ type parameters size = 1 ])
		ifTrue: [ type := type
				copyWithBindings:
					{((type parameters at: 1)
						-> (self contents collect: [ :e | e typTypeIn: aContext ]) typAsType)} asDictionary ].
	^ type
]
