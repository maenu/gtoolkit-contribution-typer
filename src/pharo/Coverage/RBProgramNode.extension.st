Extension { #name : #RBProgramNode }

{ #category : #'*Coverage' }
RBProgramNode >> covAllAssignments [
	^ self allChildren select: #isAssignment
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
