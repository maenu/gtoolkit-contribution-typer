Extension { #name : #RBSelfNode }

{ #category : #'*Typer' }
RBSelfNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ self methodNode method methodClass typAsType
]
