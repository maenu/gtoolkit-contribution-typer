Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer' }
RBLiteralArrayNode >> typTypesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypTypes new ].
	aSet add: self.
	^ TypTypes new
		increment: Array typAsType;
		yourself
]
