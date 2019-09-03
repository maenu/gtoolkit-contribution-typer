Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynAsMethodResolver [
	<typTypeResultAs: 'TypMethodResolver<TypMethodLookup>'>
	| arguments_ result |
	arguments_ := self method numArgs
		timesCollect: [ :i | self typDynTypeForArgumentAt: i ].
	result := self typDynTypeForResult.
	^ TypMethodResolver new
		argumentTypes: [ :i | arguments_ at: i ];
		resultType: [ result ];
		yourself
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynAssignNodes [
	<typTypeResultAs: 'SequenceableCollection<RBAssignmentNode>'>
	^ self assignmentNodes reject: [ :e | e variable isTemp ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynInstall [
	<typTypeResultAs: 'RBMethodNode'>
	| link |
	self typDynUninstall.
	link := MetaLink new
		metaObject: #node;
		selector: #typDynInvokeIn:;
		arguments: #(context).
	self propertyAt: #typDyn put: true.
	self propertyAt: #typDynMonitor put: Monitor new.
	self propertyAt: #typDynInvocations put: TypDynUnionType new.
	self propertyAt: #typDynLink put: link.
	self link: link.
	self typDynAssignNodes do: #typDynInstall.
	self typDynReturnNodes do: #typDynInstall.
	self method reflectiveMethod compileAndInstallCompiledMethod.
	^ self method ast
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynInvocations [
	<typTypeResultAs: 'TypDynUnionType<TypDynMessage>'>
	^ (self propertyAt: #typDynInvocations) "typCastAs TypDynUnionType<TypDynMessage>"
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynInvokeIn: aContext [
	<typTypeArgument: 1 as: 'Context'>
	| invocation |
	invocation := TypDynMessage new
		receiverType: aContext receiver typSelfType;
		selector: aContext method selector;
		argumentTypes: (aContext arguments collect: #typSelfType);
		yourself.
	self typDynMonitor
		critical: [ self typDynInvocations increment: invocation ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynIsCovered [
	<typTypeResultAs: 'Boolean'>
	^ self hasProperty: #typDyn
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynMonitor [
	<typTypeResultAs: 'Monitor'>
	^ (self propertyAt: #typDynMonitor) "typCastAs Monitor"
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynReturnNodes [
	<typTypeResultAs: 'SequenceableCollection<RBReturnNode>'>
	^ (self allChildren select: #isReturn) "typParameters RBReturnNode"
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypDynUnionType<TypType>'>
	^ self typDynInvocations
		collect: [ :f | ((f key "typCastAs TypDynMessage") argumentTypes at: anInteger) -> f value ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypeForResult [
	<typTypeResultAs: 'TypUnionType<TypType>'>
	^ (self typDynReturnNodes collect: #typDynReturns) "typParameters TypDynUnionType<TypType>"
		inject: TypDynUnionType new
		into: [ :a :b | a , b ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForClassVariables [
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol<Character>>,TypDynUnionType<TypType>>'>
	^ self
		typDynTypesForVariablesSelectedWith: [ :e | e variable binding isClassVariable ]
		definedBy: [ self methodClass classSide ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForInstanceVariables [
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol<Character>>,TypDynUnionType<TypType>>'>
	^ self typDynTypesForVariablesSelectedWith: [ :e | e variable isInstance ] definedBy: [ self methodClass ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForPoolVariables [
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol<Character>>,TypDynUnionType<TypType>>'>
	^ self
		typDynTypesForVariablesSelectedWith: [ :e | e variable binding typIsFromSharedPool ]
		definedBy: [ :e | e binding typSharedPool ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForVariables [
	"keys are unique as defining class and name are unique accross different variable kinds, concat dictionaries is fine"

	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol<Character>>,TypDynUnionType<TypType>>'>
	^ self typDynTypesForPoolVariables
		, self typDynTypesForInstanceVariables
		, self typDynTypesForClassVariables
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForVariablesSelectedWith: aBlock definedBy: anotherBlock [
	<typTypeArgument: 1 as: 'BlockClosure(RBAssignmentNode)->Boolean'>
	<typTypeArgument: 2 as: 'BlockClosure[RBVariableNode]->ClassDescription'>
	<typTypeResultAs: 'Dictionary<Association<ClassDescription,Symbol<Character>>,TypDynUnionType<TypType>>'>
	^ ((((self typDynAssignNodes select: aBlock) collect: [ :e | (anotherBlock cull: e variable) -> e variable name asSymbol -> e typDynAssigns ]) groupedBy: #key)
		collect: [ :e | e collect: #value ]) collect: [ :e | e inject: TypDynUnionType new into: [ :a :b | a , b ] ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynUninstall [
	self removeProperty: #typDyn ifAbsent: [  ].
	self removeProperty: #typDynMonitor ifAbsent: [  ].
	self removeProperty: #typDynInvocations ifAbsent: [  ].
	self
		propertyAt: #typDynLink
		ifPresent: [ :e "typCastAs MetaLink" | 
			self removeProperty: #typDynLink ifAbsent: [  ].
			self removeLink: e ]
		ifAbsent: [  ].
	self typDynAssignNodes do: #typDynUninstall.
	self typDynReturnNodes do: #typDynUninstall
]
