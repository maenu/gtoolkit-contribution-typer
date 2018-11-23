Extension { #name : #RBProgramNode }

{ #category : #'*Coverage' }
RBProgramNode >> covAllReturns [
	^ self allChildren select: #isReturn
]

{ #category : #'*Coverage' }
RBProgramNode >> covMonitor [
	^ self propertyAt: #covMonitor ifAbsentPut: [ Monitor new ]
]

{ #category : #'*Coverage' }
RBProgramNode >> covUninstall [
	self children do: #covUninstall.
	self removeProperty: #covMonitor ifAbsent: [  ]
]
