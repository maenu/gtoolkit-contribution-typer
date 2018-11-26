Extension { #name : #RBCascadeNode }

{ #category : #'*Typer' }
RBCascadeNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ messages last typTypeWithDiscovered: aSet
]
