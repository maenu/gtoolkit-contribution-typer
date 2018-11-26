Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer' }
RBLiteralValueNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ value class typAsType
]
