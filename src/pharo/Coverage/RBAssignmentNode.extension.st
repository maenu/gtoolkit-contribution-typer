Extension { #name : #RBAssignmentNode }

{ #category : #'*Coverage' }
RBAssignmentNode >> covAssign: anObject [
	| value_ |
	value_ := anObject class.
	(self propertyAt: #covMonitor) critical: [ self covAssigns add: value_ ]
]

{ #category : #'*Coverage' }
RBAssignmentNode >> covAssigns [
	^ self propertyAt: #covAssigns ifAbsent: [ CovValues new ]
]
