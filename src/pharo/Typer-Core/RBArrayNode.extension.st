Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Core' }
RBArrayNode >> typTypeRecursive [
	| type |
	type := Array typAsType.
	(type isParametric and: [ type parameters size = 1 ])
		ifTrue: [ type := type
				copyWithParameters:
					{((type parameters at: 1)
						-> (self statements collect: [ :e | e typType ]) typAsType)} asDictionary ].
	^ type
]
