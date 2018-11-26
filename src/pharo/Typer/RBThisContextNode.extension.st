Extension { #name : #RBThisContextNode }

{ #category : #'*Typer' }
RBThisContextNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ Context typAsType
]
