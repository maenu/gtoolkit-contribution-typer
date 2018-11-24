Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynAsMethodResolver [
	^ TypDynMethodResolver new
		methodClass: self method methodClass;
		methodSelector: self method selector;
		argumentTypes: (self method numArgs timesCollect: [ :i | self typDynTypesForArgumentAt: i ]);
		resultTypes: self typDynTypesForResult;
		yourself
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynInvocations [
	^ self propertyAt: #typDynInvocations ifAbsentPut: [ TypTypes new ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynInvokeIn: aContext [
	| invocation |
	invocation := TypDynMessage new
		receiverClass: aContext receiver class;
		selector: aContext method selector;
		argumentClasses:
			([ aContext arguments collect: #class ]
				on: SubscriptOutOfBounds
				do: [ self flag: 'how can this happen?'.
					aContext numArgs timesCollect: [ nil ] ]);
		yourself.
	self typDynMonitor critical: [ self typDynInvocations increment: invocation ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynIsCovered [
	^ self hasProperty: #typDyn
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForArgumentAt: anInteger [
	^ self typDynInvocations collect: [ :f | (f key argumentClasses at: anInteger) -> f value ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForResult [
	^ (self typDynReturnNodes collect: #typDynReturns) inject: TypTypes new into: [ :a :b | a , b ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynUninstall [
	super typDynUninstall.
	self removeProperty: #typDynInvocations ifAbsent: [  ]
]
