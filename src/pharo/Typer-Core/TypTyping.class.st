Class {
	#name : #TypTyping,
	#superclass : #Object,
	#category : #'Typer-Core-Utility'
}

{ #category : #accessing }
TypTyping >> invalidate [
	<gtExample>
	self invalidateLight.
	^ self memoryProbe
]

{ #category : #accessing }
TypTyping >> invalidateLight [
	<gtExample>
	GtPlaygroundEvaluatedCodeButtonAttribute
		allSubInstancesDo: [ :e | e result: nil ].
	GtSourceCoderEvaluationResultWithValue allSubInstancesDo: [ :e | e value: nil ].
	GtCoderObjectSpawnRequest allSubInstancesDo: [ :e | e object: nil ].
	GtPharoSourceCoderViewModel allSubInstancesDo: [ :e | e selfObject: nil ].
	GtTextualCoderViewModel allSubInstancesDo: #requestUpdateAddOns.
	GtLocalVariablesBindings allInstancesDo: #initialize.
	((GtWorld someInstance taskQueue instVarNamed: #tasks) value
		instVarNamed: #pendingTasks) removeAllTasks.
	AsyncRejectedPromiseState allInstances
		select: [ :e | 
			e error asString
				beginsWith: 'Instance of a subclass of ProtoObject did not understand ' ]
		thenDo: [ :e | e error: nil ].
	LeSharedSnippetContext allSubInstancesDo: [ :e | e selfObject: nil ].
	BlOverlayListener
		allInstancesDo: [ :e | e overlayElement removeEventHandler: e ].
	BlHandlerAnnouncerRegistry
		allInstancesDo: [ :e | e removeAllSuchThat: [ :f | f isKindOf: BlOverlayListener ] ].
	GtInspectorTool allInstances
		select: [ :e | e object class package name beginsWith: 'Typer' ]
		thenDo: [ :e | e object: nil ].	
	TypNode invalidateAll.
	TypType invalidateAll.
	TypIndex invalidateAll.
	TypEdgeKey invalidateAll.
	TypResolver invalidateAll.
	TypInfMethodResolver invalidate.
	TypInfMethodIndex invalidate.
	TypInfNodeStack resetSoleInstance.
	^ self
]

{ #category : #accessing }
TypTyping >> memoryProbe [
	<gtExample>
	^ {Smalltalk vm memorySize.
		Smalltalk vm statisticsReport.
		(SpaceTally new systemWideSpaceTally
			select: [ :e | e analyzedClassName beginsWith: 'Typ' ])
			sorted: [ :a :b | a instanceCount > b instanceCount ]}
]

{ #category : #accessing }
TypTyping >> parseAllAsts [

	<gtExample>
	| probes asts |
	probes := OrderedCollection new.
	ASTCache reset.
	Smalltalk garbageCollect.
	probes add: self memoryProbe.
	asts := CompiledMethod allInstances collect: [ :e | 
		        [ e ast ]
			        on: Error
			        do: #yourself ].
	Smalltalk garbageCollect.
	probes add: self memoryProbe.
	probes add: asts.
	^ probes
]
