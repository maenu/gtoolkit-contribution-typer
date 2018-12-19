Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typAssignments [
	^ (self whoDefines: self name) assignmentNodes select: [ :e | e variable isTemp and: [ e variable name = self name ] ]
]

{ #category : #'*Typer' }
RBTemporaryNode >> typType [
	^ self typAnnotateType: (self typAssignments collect: #typType) typAsType
]
