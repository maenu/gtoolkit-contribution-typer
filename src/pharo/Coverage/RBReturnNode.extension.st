Extension { #name : #RBReturnNode }

{ #category : #'*Coverage' }
RBReturnNode >> covReturn: anObject [
	| value_ |
	value_ := anObject class.
	self covMonitor critical: [ self covReturns add: value_ ]
]

{ #category : #'*Coverage' }
RBReturnNode >> covReturns [
	^ self propertyAt: #covReturns ifAbsent: [ CovValues new ]
]
