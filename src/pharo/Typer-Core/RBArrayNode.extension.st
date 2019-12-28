Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Core' }
RBArrayNode >> typTypeRecursive [
	| type |
	type := Array typAsType.
	(type isParametric and: [ type parameters size = 1 ])
		ifTrue: [ type := type
				copyWithBindings:
					{((type parameters at: 1)
						-> (self statements collect: #typType) typAsType)} asDictionary ].
	^ type
]
