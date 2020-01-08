Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typDefiningTypeIn: aContext [
	<typTypeResultAs: 'Type'>
	self assert: [ self typHasDefiningTypeIn: aContext ].
	^ aContext selfType
]

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typHasDefiningTypeIn: aContext [
	^ true
]

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typTypeRecursiveIn: aContext [
	^ self typIsAssignmentVariable
			ifTrue: [ (self parent "typCastAs RBAssignmentNode") value typTypeIn: aContext ]
			ifFalse: [ (self typDefiningTypeIn: aContext) typeForVariable: self name asSymbol ]
]
