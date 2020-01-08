Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Core' }
RBVariableNode >> typDefiningType [
	^ self typDefiningTypeIn: self methodNode typContext
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typDefiningTypeIn: aContext [
	<typTypeResultAs: 'Type'>
	self assert: [ self typHasDefiningTypeIn: aContext ].
	^ TypUnknownType instance
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typHasDefiningType [
	^ self typHasDefiningTypeIn: self methodNode typContext
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typHasDefiningTypeIn: aContext [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typIsAssignmentVariable [
	^ self parent isAssignment
		and: [ (self parent"typCastAs RBAssignmentNode") variable == self ]
]
