Extension { #name : #RBAssignmentNode }

{ #category : #'*Coverage' }
RBAssignmentNode >> covAssign: anObject [
	| value_ |
	value_ := anObject class.
	(self propertyAt: #covMonitor) critical: [ (self propertyAt: #covAssigns ifAbsentPut: [ CovValues new ]) add: value_ ]
]

{ #category : #'*Coverage' }
RBAssignmentNode >> covAssigns [
	^ self propertyAt: #covAssigns ifAbsent: [ CovValues new ]
]
