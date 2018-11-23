Extension { #name : #RBValueNode }

{ #category : #'*Typer' }
RBValueNode >> typType [
	^ self typTypes inferredType
]

{ #category : #'*Typer' }
RBValueNode >> typTypes [
	^ self typTypesWithDiscovered: Set new
]

{ #category : #'*Typer' }
RBValueNode >> typTypesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypTypes new ].
	aSet add: self.
	^ TypTypes new
		increment: Object;
		yourself
]
