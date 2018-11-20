Extension { #name : #RBMethodNode }

{ #category : #'*Coverage' }
RBMethodNode >> covCallees [
	^ self propertyAt: #covCallees ifAbsentPut: [ CovSummary new ]
]

{ #category : #'*Coverage' }
RBMethodNode >> covCallers [
	^ self propertyAt: #covCallers ifAbsentPut: [ CovSummary new ]
]

{ #category : #'*Coverage' }
RBMethodNode >> covInvocations [
	^ self propertyAt: #covInvocations ifAbsentPut: [ CovSummary new ]
]

{ #category : #'*Coverage' }
RBMethodNode >> covInvoke: aContext [
	| invocation sender |
	invocation := CovMessage new
		receiverClass: aContext receiver class;
		selector: aContext method selector;
		argumentClasses:
			([ aContext arguments collect: #class ]
				on: SubscriptOutOfBounds
				do: [ self flag: 'how can this happen?'.
					aContext numArgs timesCollect: [ nil ] ]);
		yourself.
	sender := aContext.
	[ sender sender isNotNil
		and: [ sender sender method ~~ aContext method and: [ sender sender method ast covIsCovered not and: [ sender sender method ast covIsEntryPoint not ] ] ] ]
		whileTrue: [ sender := sender sender ].
	self covMonitor
		critical: [ self covInvocations add: invocation.
			sender sender
				ifNotNil: [ | caller |
					caller := sender sender method ast.
					caller covCallees add: self.
					self covCallers add: caller ] ]
]

{ #category : #'*Coverage' }
RBMethodNode >> covIsCovered [
	^ self hasProperty: #cov
]

{ #category : #'*Coverage' }
RBMethodNode >> covIsEntryPoint [
	^ self method isTestMethod or: [ self method compiledMethod isGTExampleMethod ]
]

{ #category : #'*Coverage' }
RBMethodNode >> covUninstall [
	super covUninstall.
	self removeProperty: #covCallees ifAbsent: [  ].
	self removeProperty: #covCallers ifAbsent: [  ].
	self removeProperty: #covInvocations ifAbsent: [  ]
]
