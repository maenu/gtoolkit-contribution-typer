Extension { #name : #RBMethodNode }

{ #category : #'*CallGraph' }
RBMethodNode >> caGrCallees [
	^ self propertyAt: #caGrCallees ifAbsentPut: [ TypTypes new ]
]

{ #category : #'*CallGraph' }
RBMethodNode >> caGrCallers [
	^ self propertyAt: #caGrCallers ifAbsentPut: [ TypTypes new ]
]

{ #category : #'*CallGraph' }
RBMethodNode >> caGrInvocations [
	^ self propertyAt: #caGrInvocations ifAbsentPut: [ TypTypes new ]
]

{ #category : #'*CallGraph' }
RBMethodNode >> caGrInvokeIn: aContext [
	| invocation sender |
	invocation := TypDynMessage new
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
		and: [ sender sender method ~~ aContext method and: [ sender sender method ast typDynIsCovered not and: [ sender sender method ast caGrIsEntryPoint not ] ] ] ]
		whileTrue: [ sender := sender sender ].
	self typDynMonitor
		critical: [ self typDynInvocations increment: invocation.
			sender sender
				ifNotNil: [ | caller |
					caller := sender sender method ast.
					caller typDynCallees increment: self.
					self typDynCallers increment: caller ] ]
]

{ #category : #'*CallGraph' }
RBMethodNode >> caGrIsEntryPoint [
	^ self method isTestMethod or: [ self method compiledMethod isGTExampleMethod ]
]

{ #category : #'*CallGraph' }
RBMethodNode >> caGrRunAsEntryPoint [
	self assert: [ self caGrIsEntryPoint ].
	self method isTestMethod
		ifTrue: [ ^ self method methodClass run: self method selector ].
	self method isGTExampleMethod
		ifTrue: [ ^ self method gtExampleValue ]
]
