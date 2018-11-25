Extension { #name : #RBSuperNode }

{ #category : #'*Typer' }
RBSuperNode >> typTypesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypTypes new ].
	aSet add: self.
	^ TypTypes new
		increment: self methodNode method methodClass superclass typAsType;
		yourself
]
