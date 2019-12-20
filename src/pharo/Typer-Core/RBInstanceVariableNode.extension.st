Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typDefiningClass [
	<typTypeResultAs: 'Class'>
	self assert: [ self typHasDefiningClass ].
	^ self methodNode methodClass
]

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typHasDefiningClass [
	^ true
]

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typTypeRecursive [
	^ (self parent isAssignment and: [ (self parent "typCastAs RBAssignmentNode") variable == self ])
		ifTrue: [ (self parent "typCastAs RBAssignmentNode") value typType ]
		ifFalse: [ self methodNode methodClass typTypeForVariable: self name asSymbol ]
	
]
