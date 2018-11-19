Extension { #name : #RBAssignmentNode }

{ #category : #'*Coverage' }
RBAssignmentNode >> covAssign: anObject [
	| value_ |
	value_ := anObject class.
	self covMonitor critical: [ self covAssigns add: value_ ]
]

{ #category : #'*Coverage' }
RBAssignmentNode >> covAssigns [
	^ self propertyAt: #covAssigns ifAbsentPut: [ CovValues new ]
]
