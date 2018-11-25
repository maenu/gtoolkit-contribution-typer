Extension { #name : #RBSelfNode }

{ #category : #'*Typer' }
RBSelfNode >> typTypesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypTypes new ].
	aSet add: self.
	^ TypTypes new
		increment: self methodNode method methodClass typAsType;
		yourself
]
