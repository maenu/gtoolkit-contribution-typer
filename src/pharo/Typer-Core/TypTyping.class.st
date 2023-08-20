Class {
	#name : #TypTyping,
	#superclass : #Object,
	#category : #'Typer-Core-Utility'
}

{ #category : #accessing }
TypTyping >> invalidate [
	<gtExample>
	| queue |
	ASTCache reset.	"TKTCommonQueueWorkerPool allSubInstancesDo: #removeFailedTasks."
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
		thenDo: [ :e | e object: nil ].	"LeDatabase allInstancesDo: #reload.
	LeDatabasesRegistry cleanUp.
	LeDatabasesRegistry uniqueInstance ensureDatabase.
	GtHome allInstancesDo: #clearKnowledgeBase."
	TypNode invalidateAll.
	TypType invalidateAll.
	TypIndex invalidateAll.
	TypEdgeKey invalidateAll.
	TypResolver invalidateAll.
	TypInfMethodResolver invalidate.
	TypInfMethodIndex invalidate.
	TypInfNodeStack resetSoleInstance.
	^ self memoryProbe
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
TypTyping >> monitorMemoryAllMethods [

	<gtExample>
	^ self
		  monitorMemoryMethods: CompiledMethod allInstances
		  timeout: 5 seconds
]

{ #category : #accessing }
TypTyping >> monitorMemoryMethods: aCollection timeout: aDuration [
	^ aCollection
		reduce: [ :r :e | r then: [ self typeAndMonitorMethod: e timeout: aDuration ] ]
]

{ #category : #accessing }
TypTyping >> monitorMemorySomeMethods [

	<gtExample>
	| all methods |
	all := CompiledMethod allInstances.
	methods := IdentitySet new.
	[ methods size < 3 ] whileTrue: [ methods add: all atRandom ].
	all := nil.
	^ self monitorMemoryMethods: methods timeout: 30 seconds
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

{ #category : #accessing }
TypTyping >> typeAllMethods [

	<gtExample>
	| results methods |
	results := OrderedCollection new.
	methods := CompiledMethod allInstances.
	[ 
	methods do: [ :e | 
		results add: (self typeMethod: e timeout: 30 seconds) ] ] 
		forkNamed: 'typeAllMethods'.
	^ results
]

{ #category : #accessing }
TypTyping >> typeAndMonitorMethod: aMethod [
	^ self typeAndMonitorMethod: aMethod timeout: 5 minutes
]

{ #category : #accessing }
TypTyping >> typeAndMonitorMethod: aMethod timeout: aDuration [
	| promise start semaphore process error timeout result tally |
	promise := AsyncPendingPromise new.
	start := DateAndTime now.
	timeout := false.
	semaphore := Semaphore new.
	tally := MessageTally new.
	process := [ [ [ tally spyEvery: 1 on: [ result := aMethod ast typInfTypeSelf ] ]
			on: Exception - OCUndeclaredVariableWarning - OCShadowVariableWarning
			do: [ :e | 
				e freeze.
				error := e ] ] ensure: [ semaphore signal ] ]
			forkAt: Processor userBackgroundPriority.
	^ [ semaphore
		wait: aDuration
		onCompletion: [ error
				ifNil: [ TypMethodMeasurement
						method: aMethod
						duration: DateAndTime now - start
						result: result
						tally: tally ]
				ifNotNil: [ TypMethodMeasurement
						method: aMethod
						duration: DateAndTime now - start
						error: error
						tally: tally ] ]
		onTimeout: [ process suspend.
			timeout := true.
			TypMethodMeasurement
				method: aMethod
				duration: DateAndTime now - start
				process: process
				tally: tally ] ] asAsyncFuture
		await: AsyncFutureExecutionConfiguration new lowPriority
]

{ #category : #accessing }
TypTyping >> typeMethod: aMethod timeout: aDuration [
	| promise start end semaphore process error timeout result |
	start := DateAndTime now.
	timeout := false.
	semaphore := Semaphore new.
	process := [ [ [ result := aMethod ast typInfTypeSelf ]
			on: Exception - OCUndeclaredVariableWarning - OCShadowVariableWarning
			do: [ :e | 
				e freeze.
				error := e ] ] ensure: [ semaphore signal ] ] fork.
	^ [ semaphore
		wait: aDuration
		onCompletion: [  ]
		onTimeout: [ process suspend.
			timeout := true ].
	end := DateAndTime now.
	timeout
		ifTrue: [ TypMethodMeasurement
				method: aMethod
				duration: end - start
				process: process ]
		ifFalse: [ error
				ifNil: [ TypMethodMeasurement
						method: aMethod
						duration: end - start
						result: result ]
				ifNotNil: [ TypMethodMeasurement
						method: aMethod
						duration: end - start
						error: error ] ] ] asAsyncPromise
]

{ #category : #accessing }
TypTyping >> typeSomeMethods [

	<gtExample>
	| all methods |
	all := CompiledMethod allInstances.
	methods := IdentitySet new.
	[ methods size < 3 ] whileTrue: [ methods add: all atRandom ].
	all := nil.
	^ methods asOrderedCollection collect: [ :e | 
		  self typeMethod: e timeout: 30 seconds ]
]

{ #category : #accessing }
TypTyping >> typeSomeMonitoredMethods [
	<gtExample>
	| all methods |
	all := CompiledMethod allInstances.
	methods := IdentitySet new.
	[ methods size < 3 ] whileTrue: [ methods add: all atRandom ].
	all := nil.
	^ methods asOrderedCollection
		collect: [ :e | self typeAndMonitorMethod: e timeout: 30 seconds ]
]
