Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynAsMethodLookupResult [
	<typTypeResultAs: '{!,TypMethodLookupResult}'>
	| arguments_ result |
	arguments_ := (self method numArgs
		timesCollect: [ :i | self typDynTypeForArgumentAt: i ])
		collect: #asNonDynType.
	result := self typDynTypeForResult asNonDynType.
	^ result isUnknown
		ifTrue: [ nil ]
		ifFalse: [ TypFunctionType new
				argumentTypes: [ :i | arguments_ at: i ];
				resultType: [ result ];
				yourself ]
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
	self propertyAt: #typDynStashed put: TypDynUnionType new.
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
	<typTypeResultAs: 'TypDynUnionType'>
	^ (self propertyAt: #typDynInvocations) "typCastAs TypDynUnionType"
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynInvokeIn: aContext [
	<typTypeArgument: 1 as: 'Context'>
	SharedRandom globalGenerator next
		< (1 - (self typDynInvocations weights size / 200))
		ifTrue: [ self typDynInvocations
				add:
					(TypDynMessage new
						receiverType: aContext receiver typInfSelfType;
						selector: aContext method selector;
						argumentTypes: (aContext arguments collect: #typInfSelfType);
						yourself) ].
	self typDynInvocations weights size >= 100
		ifTrue: [ self typDynRemoveLink ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynRemoveLink [
	self
		propertyAt: #typDynLink
		ifPresent: [ :e "typCastAs MetaLink"
			 | 
			self removeProperty: #typDynLink ifAbsent: [  ].
			self removeLink: e ]
		ifAbsent: [  ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynReturnNodes [
	<typTypeResultAs: 'SequenceableCollection<RBReturnNode>'>
	^ (self allChildren select: #isReturn) "typParameters RBReturnNode"
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynStash [
	self typDynStashed addAll: self typDynInvocations.
	self propertyAt: #typDynInvocations put: TypDynUnionType new.
	self typDynAssignNodes do: #typDynStash.
	self typDynReturnNodes do: #typDynStash
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynStashed [
	^ self propertyAt: #typDynStashed
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypDynUnionType'>
	^ (self typDynInvocations , self typDynStashed)
		collect: [ :f | (f "typCastAs TypDynMessage") argumentTypes at: anInteger ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypeForResult [
	<typTypeResultAs: 'TypUnionType'>
	^ (self typDynReturnNodes collect: [ :e | e typDynReturns , e typDynStashed ]) "typParameters TypDynUnionType"
		inject: TypDynUnionType new
		into: [ :a :b | a , b ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForClassVariables [
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol>,TypDynUnionType>'>
	^ self
		typDynTypesForVariablesSelectedWith: [ :e | e variable binding isClassVariable ]
		definedBy: [ self methodClass classSide ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForInstanceVariables [
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol>,TypDynUnionType>'>
	^ self typDynTypesForVariablesSelectedWith: [ :e | e variable isInstance ] definedBy: [ self methodClass ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForPoolVariables [
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol>,TypDynUnionType>'>
	^ self
		typDynTypesForVariablesSelectedWith: [ :e | e variable binding typInfIsFromSharedPool ]
		definedBy: [ :e | e binding typInfSharedPool ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForVariables [
	"keys are unique as defining class and name are unique accross different variable kinds, concat dictionaries is fine"

	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol>,TypDynUnionType>'>
	^ self typDynTypesForPoolVariables
		, self typDynTypesForInstanceVariables
		, self typDynTypesForClassVariables
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynTypesForVariablesSelectedWith: aBlock definedBy: anotherBlock [
	<typTypeArgument: 1 as: 'BlockClosure(RBAssignmentNode)->Boolean'>
	<typTypeArgument: 2 as: 'BlockClosure[RBVariableNode]->ClassDescription'>
	<typTypeResultAs: 'Dictionary<Association<ClassDescription,Symbol>,TypDynUnionType>'>
	^ ((((self typDynAssignNodes select: aBlock) collect: [ :e | (anotherBlock cull: e variable) -> e variable name asSymbol -> (e typDynAssigns , e typDynStashed)]) groupedBy: #key)
		collect: [ :e | e collect: #value ]) collect: [ :e | e inject: TypDynUnionType new into: [ :a :b | a , b ] ]
]

{ #category : #'*Typer-Dynamic' }
RBMethodNode >> typDynUninstall [
	self removeProperty: #typDynStashed ifAbsent: [  ].
	self removeProperty: #typDynInvocations ifAbsent: [  ].
	self typDynRemoveLink.
	self typDynAssignNodes do: #typDynUninstall.
	self typDynReturnNodes do: #typDynUninstall
]
