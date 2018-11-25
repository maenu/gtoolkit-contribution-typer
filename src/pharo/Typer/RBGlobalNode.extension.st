Extension { #name : #RBGlobalNode }

{ #category : #'*Typer' }
RBGlobalNode >> typTypesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypTypes new ].
	aSet add: self.
	^ TypTypes new
		increment: self binding value class typAsType;
		yourself
]
