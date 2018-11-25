Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynAsMethodResolver [
	^ TypMethodResolver new
		methodType: self method methodClass typAsType;
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
		receiverType: aContext receiver class typAsType;
		selector: aContext method selector;
		argumentTypes:
			([ aContext arguments collect: [ :e | e class typAsType ] ]
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
	^ self typDynInvocations collect: [ :f | (f key argumentTypes at: anInteger) -> f value ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForInstanceVariables [
	^ (((self typDynAssignNodes collect: [ :e | e variable name -> e typDynAssigns ]) groupedBy: #key) collect: [ :e | e collect: #value ])
		collect: [ :e | e inject: TypTypes new into: [ :a :b | a , b ] ]
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
