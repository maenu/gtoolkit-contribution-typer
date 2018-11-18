Extension { #name : #RBProgramNode }

{ #category : #'*Coverage' }
RBProgramNode >> covAllAssignments [
	^ self allChildren select: #isAssignment
]

{ #category : #'*Coverage' }
RBProgramNode >> covAllBlockBodies [
	^ (self allChildren select: #isBlock) collect: #body
]

{ #category : #'*Coverage' }
RBProgramNode >> covAllBlocks [
	^ self allChildren select: #isBlock
]

{ #category : #'*Coverage' }
RBProgramNode >> covAllMessages [
	self flag: 'cascaded seem not to work'.
	^ (self allChildren select: #isMessage) reject: #isCascade
]

{ #category : #'*Coverage' }
RBProgramNode >> covAllReturns [
	^ self allChildren select: #isReturn
]

{ #category : #'*Coverage' }
RBProgramNode >> covMonitor [
	^ self propertyAt: #covMonitor ifAbsentPut: [ Monitor new ]
]
