Extension { #name : #RBGlobalNode }

{ #category : #'*Typer' }
RBGlobalNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ self binding value class typAsType
]
