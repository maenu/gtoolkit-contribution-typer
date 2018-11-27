Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynAsMethodResolver [
	| arguments_ result |
	arguments_ := (self method numArgs timesCollect: [ :i | self typDynTypeForArgumentAt: i ]).
	result := self typDynTypeForResult.
	^ TypMethodResolver new
		receiverType: self method methodClass typAsType;
		selector: self method selector;
		argumentTypes: [ arguments_ ];
		resultType: [ result ];
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
		argumentTypes: (aContext arguments collect: [ :e | e class typAsType ]);
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
	^ self typDynTypesForVariablesSelectedWith: [ :e | e variable isInstance not and: [ e variable binding isGlobalClassNameBinding not and: [ e variable binding isFromSharedPool ] ] ]
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
