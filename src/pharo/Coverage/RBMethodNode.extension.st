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
RBMethodNode >> covClassForArgumentAt: anInteger [
	^ ((self covInvocations collect: [ :e | (e key argumentClasses at: anInteger) -> e value ]) select: [ :e | e key isNotNil ]) inferredClass
]

{ #category : #'*Coverage' }
RBMethodNode >> covClassForArgumentNamed: aString [
	| i |
	i := self arguments detectIndex: [ :f | f name = aString ].
	^ self covClassForArgumentAt: i
]

{ #category : #'*Coverage' }
RBMethodNode >> covInferredArgumentClasses [
	| allClasses |
	allClasses := self covInvocations collect: [ :e | e key argumentClasses -> e value ].
	^ self numArgs
		timesCollect: [ :i | 
			| classes |
			classes := (allClasses collect: [ :e | (e key at: i) -> e value ]) select: [ :e | e key isNotNil ].
			classes isEmpty
				ifTrue: [ classes inferredClass ]
				ifFalse: [ Object ] ]
]

{ #category : #'*Coverage' }
RBMethodNode >> covInferredReturnClass [
	| allClasses |
	allClasses := self covAllReturns flatCollect: #covReturns.
	^ (allClasses select: [ :e | e key isNotNil ]) inferredClass
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
		critical: [ self covInvocations increment: invocation.
			sender sender
				ifNotNil: [ | caller |
					caller := sender sender method ast.
					caller covCallees increment: self.
					self covCallers increment: caller ] ]
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
RBMethodNode >> covRunAsEntryPoint [
	self assert: [ self covIsEntryPoint ].
	self method isTestMethod
		ifTrue: [ ^ self method methodClass run: self method selector ].
	self method isGTExampleMethod
		ifTrue: [ ^ self method gtExampleValue ]
]

{ #category : #'*Coverage' }
RBMethodNode >> covUninstall [
	super covUninstall.
	self removeProperty: #covCallees ifAbsent: [  ].
	self removeProperty: #covCallers ifAbsent: [  ].
	self removeProperty: #covInvocations ifAbsent: [  ]
]
