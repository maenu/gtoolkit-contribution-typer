Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Core' }
RBAssignmentNode >> typSignalsAlwaysIn: aContext [
	^ self value typSignalsAlwaysIn: aContext
]

{ #category : #'*Typer-Core' }
RBAssignmentNode >> typTypeRecursiveIn: aContext [
	^ self variable typTypeIn: aContext
]
