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
	self subclassResponsibility
]
