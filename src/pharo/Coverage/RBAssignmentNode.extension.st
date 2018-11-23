Extension { #name : #RBAssignmentNode }

{ #category : #'*Coverage' }
RBAssignmentNode >> covClass [
	^ variable covClass
]

{ #category : #'*Coverage' }
RBAssignmentNode >> covUninstall [
	super covUninstall.
	self removeProperty: #covAssigns ifAbsent: [  ].
]
