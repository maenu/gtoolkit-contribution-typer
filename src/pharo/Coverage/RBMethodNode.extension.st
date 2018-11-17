Extension { #name : #RBMethodNode }

{ #category : #'*Coverage' }
RBMethodNode >> covInvocations [
	^ self propertyAt: #covInvocations ifAbsent: [ OrderedCollection new ]
]

{ #category : #'*Coverage' }
RBMethodNode >> covInvoke: aContext [
	| invocation |
	invocation := aContext stack
		collect: [ :e | 
			{e method.
			aContext receiver class.
			(aContext arguments collect: #class)} ].
	(self propertyAt: #covMonitor)
		critical:
			[ (self propertyAt: #covInvocations ifAbsentPut: [ OrderedCollection new ]) add: invocation ]
]
