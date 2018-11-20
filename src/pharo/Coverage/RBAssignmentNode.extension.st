Extension { #name : #RBAssignmentNode }

{ #category : #'*Coverage' }
RBAssignmentNode >> covAssign: anObject [
	| value_ |
	value_ := anObject class.
	self covMonitor critical: [ self covAssigns add: value_ ]
]

{ #category : #'*Coverage' }
RBAssignmentNode >> covAssigns [
	^ self propertyAt: #covAssigns ifAbsentPut: [ CovSummary new ]
]

{ #category : #'*Coverage' }
RBAssignmentNode >> covUninstall [
	super covUninstall.
	self removeProperty: #covAssigns ifAbsent: [  ].
]
