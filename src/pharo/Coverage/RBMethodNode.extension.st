Extension { #name : #RBMethodNode }

{ #category : #'*Coverage' }
RBMethodNode >> covInvocations [
	^ self propertyAt: #covInvocations ifAbsent: [ OrderedCollection new ]
]

{ #category : #'*Coverage' }
RBMethodNode >> covInvoke: aContext [
	| invocations |
	invocations := (aContext stackOfSize: 100)
		collect: [ :e | 
			CovInvocation new
				method: e method;
				receiverClass: aContext receiver class;
				argumentClasses: (aContext arguments collect: #class);
				yourself ].
	(self propertyAt: #covMonitor) critical: [ (self propertyAt: #covInvocations ifAbsentPut: [ CovInvocations new ]) add: invocations ]
]
