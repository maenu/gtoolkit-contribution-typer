Extension { #name : #RBThisContextNode }

{ #category : #'*Typer' }
RBThisContextNode >> typTypesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypTypes new ].
	aSet add: self.
	^ TypTypes new
		increment: Context typAsType;
		yourself
]
