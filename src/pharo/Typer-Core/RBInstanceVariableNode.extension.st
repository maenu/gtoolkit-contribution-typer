Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typTypeRecursive [
	^ (self parent isAssignment and: [ (self parent "typCastAs RBAssignmentNode") variable == self ])
		ifTrue: [ (self parent "typCastAs RBAssignmentNode") value typType ]
		ifFalse: [ self methodNode methodClass typTypeForVariable: self name asSymbol ]
	
]
