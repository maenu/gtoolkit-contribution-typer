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
				receiverClass: e receiver class;
				argumentClasses:
					([ e arguments collect: #class ]
						on: SubscriptOutOfBounds
						do: [ self flag: 'how can this happen?'.
							e method numArgs timesCollect: [ nil ] ]);
				yourself ].
	(self propertyAt: #covMonitor)
		critical: [ (self propertyAt: #covInvocations ifAbsentPut: [ CovInvocations new ]) add: invocations ]
]
