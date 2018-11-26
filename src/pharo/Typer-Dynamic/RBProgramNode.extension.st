Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Dynamic' }
RBProgramNode >> typDynAssignNodes [
	^ self assignmentNodes reject: [ :e | e variable isTemp ]
]

{ #category : #'*Typer-Dynamic' }
RBProgramNode >> typDynMonitor [
	^ self propertyAt: #typDynMonitor ifAbsentPut: [ Monitor new ]
]

{ #category : #'*Typer-Dynamic' }
RBProgramNode >> typDynReturnNodes [
	^ self allChildren select: #isReturn
]

{ #category : #'*Typer-Dynamic' }
RBProgramNode >> typDynUninstall [
	self children do: #typDynUninstall.
	self removeProperty: #typDynMonitor ifAbsent: [  ]
]
