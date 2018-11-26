Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynAsMethodResolver [
	^ TypMethodResolver new
		receiverType: self method methodClass typAsType;
		selector: self method selector;
		argumentTypes: (self method numArgs timesCollect: [ :i | self typDynTypeForArgumentAt: i ]);
		resultType: self typDynTypeForResult;
		yourself
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynInvocations [
	^ self propertyAt: #typDynInvocations ifAbsentPut: [ TypUnionType new ]
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
					aContext numArgs timesCollect: [ TypUnknownType instance ] ]);
		yourself.
	self typDynMonitor critical: [ self typDynInvocations increment: invocation ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynIsCovered [
	^ self hasProperty: #typDyn
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypeForArgumentAt: anInteger [
	^ self typDynInvocations collect: [ :f | (f key argumentTypes at: anInteger) -> f value ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypeForResult [
	^ (self typDynReturnNodes collect: #typDynReturns) inject: TypUnionType new into: [ :a :b | a , b ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForClassVariables [
	^ self typDynTypesForVariablesSelectedWith: [ :e | e variable isInstance not and: [ e variable binding isClassVariable ] ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForInstanceVariables [
	^ self typDynTypesForVariablesSelectedWith: [ :e | e variable isInstance ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForPoolVariables [
	^ self typDynTypesForVariablesSelectedWith: [ :e | e variable isInstance not and: [ e variable binding isGlobalClassNameBinding not ] ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForVariablesSelectedWith: aBlock [
	^ ((((self typDynAssignNodes select: aBlock) collect: [ :e | e variable name -> e typDynAssigns ]) groupedBy: #key) collect: [ :e | e collect: #value ]) collect: [ :e | e inject: TypUnionType new into: [ :a :b | a , b ] ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynUninstall [
	super typDynUninstall.
	self removeProperty: #typDynInvocations ifAbsent: [  ]
]
