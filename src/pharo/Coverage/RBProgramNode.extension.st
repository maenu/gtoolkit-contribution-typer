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
RBProgramNode >> covAllBlockBodyLasts [
	^ (self covAllBlockBodies select: [ :e | e children isNotEmpty ]) collect: #last
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

{ #category : #'*Coverage' }
RBProgramNode >> covReturn: anObject [
	| value_ |
	value_ := anObject class.
	self covMonitor critical: [ self covReturns add: value_ ]
]

{ #category : #'*Coverage' }
RBProgramNode >> covReturns [
	^ self propertyAt: #covReturns ifAbsent: [ CovValues new ]
]
