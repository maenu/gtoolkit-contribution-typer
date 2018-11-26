Extension { #name : #RBSuperNode }

{ #category : #'*Typer' }
RBSuperNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ self methodNode method methodClass superclass typAsType
]
