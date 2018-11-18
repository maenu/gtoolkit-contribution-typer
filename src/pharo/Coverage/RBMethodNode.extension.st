Extension { #name : #RBMethodNode }

{ #category : #'*Coverage' }
RBMethodNode >> covInvocations [
	^ self propertyAt: #covInvocations ifAbsent: [ CovInvocations new ]
]

{ #category : #'*Coverage' }
RBMethodNode >> covInvoke: aContext [
	| invocations |
	self flag: 'make stack customizable'.
	invocations := (aContext stackOfSize: 10)
		collect: [ :e | 
			CovInvocation new
				method: e method;
				receiverClass: e receiver class;
				argumentClasses:
					([ e arguments collect: #class ]
						on: SubscriptOutOfBounds
						do: [ self flag: 'how can this happen?'.
							e method numArgs timesCollect: [ nil ] ]);
				yourself ].
	(self propertyAt: #covMonitor)
		critical: [ self covInvocations add: invocations ]
]
