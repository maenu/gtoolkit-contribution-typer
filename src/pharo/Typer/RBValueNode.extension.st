Extension { #name : #RBValueNode }

{ #category : #'*Typer' }
RBValueNode >> typType [
	^ self typTypeWithDiscovered: Set new
]

{ #category : #'*Typer' }
RBValueNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ Object typAsType
]
