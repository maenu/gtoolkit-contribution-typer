Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer' }
RBAssignmentNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ value typTypeWithDiscovered: aSet
]
