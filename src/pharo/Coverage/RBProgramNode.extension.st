Extension { #name : #RBProgramNode }

{ #category : #'*Coverage' }
RBProgramNode >> covAllAssignments [
	^ self allChildren select: #isAssignment
]

{ #category : #'*Coverage' }
RBProgramNode >> covAllBlockBodies [
	self flag: 'non-working hack for block closures, needs context, arguments, return for block closure'.
	^ (self allChildren select: #isBlock) collect: #body
]

{ #category : #'*Coverage' }
RBProgramNode >> covAllBlockBodyLasts [
	self flag: 'non-working hack for block closures, needs context, arguments, return for block closure'.
	^ (self covAllBlockBodies select: [ :e | e children isNotEmpty ])
		collect: [ :e | 
			| last |
			last := e children last.
			last isCascade
				ifTrue: [ last children last ]
				ifFalse: [ last ] ]
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
	self flag: 'non-working hack for block closures, needs context, arguments, return for block closure'.
	value_ := anObject class.
	self covMonitor critical: [ self covReturns add: value_ ]
]

{ #category : #'*Coverage' }
RBProgramNode >> covReturns [
	self flag: 'non-working hack for block closures, needs context, arguments, return for block closure'.
	^ self propertyAt: #covReturns ifAbsentPut: [ CovValues new ]
]
