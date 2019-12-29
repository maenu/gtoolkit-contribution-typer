Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Core' }
RBVariableNode >> typHasDefiningClass [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typIsAssignmentVariable [
	^ self parent isAssignment
		and: [ (self parent"typCastAs RBAssignmentNode") variable == self ]
]
