Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynAsMethodResolver [
	| arguments_ result |
	arguments_ := self method numArgs timesCollect: [ :i | self typDynTypeForArgumentAt: i ].
	result := self typDynTypeForResult.
	^ TypMethodResolver new
		argumentTypes: [ :i | arguments_ at: i ];
		resultType: [ result ];
		yourself
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynAssignNodes [
	^ self assignmentNodes reject: [ :e | e variable isTemp ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynInstall [
	| link |
	self typDynUninstall.
	link := MetaLink new
		metaObject: #node;
		selector: #typDynInvokeIn:;
		arguments: #(context).
	self propertyAt: #typDyn put: true.
	self propertyAt: #typDynMonitor put: Monitor new.
	self propertyAt: #typDynInvocations put: TypUnionType new.
	self propertyAt: #typDynLink put: link.
	self link: link.
	self typDynAssignNodes do: #typDynInstall.
	self typDynReturnNodes do: #typDynInstall.
	self method reflectiveMethod compileAndInstallCompiledMethod.
	^ self method ast
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynInvocations [
	^ self propertyAt: #typDynInvocations
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
RBMethodNode >> typDynMonitor [
	^ self propertyAt: #typDynMonitor
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynReturnNodes [
	^ self allChildren select: #isReturn
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
	^ self typDynTypesForVariablesSelectedWith: [ :e | e variable binding isClassVariable ] definedBy: [ self methodClass classSide ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForInstanceVariables [
	^ self typDynTypesForVariablesSelectedWith: [ :e | e variable isInstance ] definedBy: [ self methodClass ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForPoolVariables [
	^ self typDynTypesForVariablesSelectedWith: [ :e | e variable binding typIsFromSharedPool ] definedBy: [ :e | e binding typSharedPool ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForVariables [
	"keys are unique as defining class and name are unique accross different variable kinds, concat dictionaries is fine"

	^ self typDynTypesForPoolVariables , self typDynTypesForInstanceVariables , self typDynTypesForClassVariables
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForVariablesSelectedWith: aBlock definedBy: anotherBlock [
	^ ((((self typDynAssignNodes select: aBlock) collect: [ :e | (anotherBlock cull: e variable) -> e variable name -> e typDynAssigns ]) groupedBy: #key) collect: [ :e | e collect: #value ]) collect: [ :e | e inject: TypUnionType new into: [ :a :b | a , b ] ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynUninstall [
	self removeProperty: #typDyn ifAbsent: [  ].
	self removeProperty: #typDynMonitor ifAbsent: [  ].
	self removeProperty: #typDynInvocations ifAbsent: [  ].
	self
		propertyAt: #typDynLink
		ifPresent: [ :e | 
			self removeProperty: #typDynLink ifAbsent: [  ].
			self removeLink: e ]
		ifAbsent: [  ].
	self typDynAssignNodes do: #typDynUninstall.
	self typDynReturnNodes do: #typDynUninstall
]
