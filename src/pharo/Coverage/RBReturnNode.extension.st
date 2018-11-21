Extension { #name : #RBReturnNode }

{ #category : #'*Coverage' }
RBReturnNode >> covReturn: anObject [
	| value_ |
	value_ := anObject class.
	self covMonitor critical: [ self covReturns increment: value_ ]
]

{ #category : #'*Coverage' }
RBReturnNode >> covReturns [
	^ self propertyAt: #covReturns ifAbsentPut: [ CovSummary new ]
]

{ #category : #'*Coverage' }
RBReturnNode >> covUninstall [
	super covUninstall.
	self removeProperty: #covReturns ifAbsent: [  ].
]
