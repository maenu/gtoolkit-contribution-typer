Extension { #name : #RBReturnNode }

{ #category : #'*Coverage' }
RBReturnNode >> covReturn: anObject [
	| value_ |
	value_ := anObject class.
	(self propertyAt: #covMonitor) critical: [ (self propertyAt: #covReturns ifAbsentPut: [ CovValues new ]) add: value_ ]
]

{ #category : #'*Coverage' }
RBReturnNode >> covReturns [
	^ self propertyAt: #covReturns ifAbsent: [ OrderedCollection new ]
]
