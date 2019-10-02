Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Core' }
RBArrayNode >> typTypeRecursive [
	| type |
	type := Array typAsType.
	(type isParametric and: [ type bindings size = 1 ])
		ifTrue: [ type := type copy.
			type bindings
				at: type bindings keys first
				put: (self statements collect: #typType) typAsType ].
	^ type
]
