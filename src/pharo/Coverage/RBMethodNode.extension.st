Extension { #name : #RBMethodNode }

{ #category : #'*Coverage' }
RBMethodNode >> covInvocations [
	^ self propertyAt: #covInvocations ifAbsent: [ OrderedCollection new ]
]

{ #category : #'*Coverage' }
RBMethodNode >> covInvoke: aContext [
	| invocation |
	invocation := {aContext receiver class.
	(aContext arguments collect: [ :e | e class ]).
	(aContext stack collect: [ :e | e method ])}.
	(self propertyAt: #covMonitor) critical: [ (self propertyAt: #covInvocations ifAbsentPut: [ OrderedCollection new ]) add: invocation ]
]
