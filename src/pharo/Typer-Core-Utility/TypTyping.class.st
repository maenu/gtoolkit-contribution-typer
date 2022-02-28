Class {
	#name : #TypTyping,
	#superclass : #Object,
	#category : #'Typer-Core-Utility'
}

{ #category : #accessing }
TypTyping >> invalidate [

	<gtExample>
	| probes |
	probes := OrderedCollection new.
	probes add: 'pre-reset' -> self memoryProbe.
	ASTCache reset.
	TKTCommonQueueWorkerPool allSubInstancesDo: #removeFailedTasks.
	GtPlaygroundEvaluatedCodeButtonAttribute allSubInstancesDo: [ :e | 
		e result: nil ].
	GtSourceCoderEvaluationResultWithValue allSubInstancesDo: [ :e | 
		e value: nil ].
	GtCoderObjectSpawnRequest allSubInstancesDo: [ :e | e object: nil ].
	GtPharoSourceCoderViewModel allSubInstancesDo: [ :e | 
		e selfObject: nil ].
	GtTextualCoderViewModel allSubInstancesDo: #requestUpdateAddOns.
	LeSharedSnippetContext allSubInstancesDo: [ :e | e selfObject: nil ].
	BlOverlayListener allInstancesDo: [ :e | 
		e overlayElement removeEventHandler: e ].
	"LeDatabase allInstancesDo: #reload."
	LeDatabasesRegistry cleanUp.
	LeDatabasesRegistry uniqueInstance ensureDatabase.
	GtHome allInstancesDo: #clearKnowledgeBase.
	TypNode invalidateAll.
	TypType invalidateAll.
	TypIndex invalidateAll.
	TypResolver invalidateAll.
	TypShaShadow invalidateAll.
	TypInfImplementorsCache invalidate.
	Smalltalk garbageCollect.
	probes add: 'post-reset' -> self memoryProbe.
	^ probes
]

{ #category : #accessing }
TypTyping >> memoryProbe [

	<gtExample>
	^ { 
		  Smalltalk vm memorySize.
		  Smalltalk vm statisticsReport.
		  SpaceTally new systemWideSpaceTally }
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

	| probes result tally |
	probes := Dictionary new.
	probes at: 'pre-load' put: self memoryProbe.
	tally := MessageTally on: [ 
		         result := aCollection collect: [ :e | 
			                   self typeMethod: e timeout: aDuration ] ].
	probes at: 'post-load' put: self memoryProbe.
	Smalltalk garbageCollect.
	probes at: 'post-gc' put: self memoryProbe.
	^ { 
		  result.
		  tally.
		  probes }
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
TypTyping >> typeMethod: aMethod timeout: aDuration [

	| start end semaphore process error timeout result |
	start := DateAndTime now.
	timeout := false.
	semaphore := Semaphore new.
	process := [ 
	           [ 
	           [ result := aMethod typInfTypeInSelf ]
		           on: Exception
		           do: [ :e | 
			           (e isKindOf: OCUndeclaredVariableWarning)
				           ifTrue: [ e resume: e declareUndefined ]
				           ifFalse: [ 
					           (e isKindOf: OCShadowVariableWarning)
						           ifTrue: [ e resume ]
						           ifFalse: [ 
							           e freeze.
							           error := e ] ] ] ] ensure: [ semaphore signal ] ]
		           fork.
	semaphore wait: aDuration onCompletion: [  ] onTimeout: [ 
		process suspend.
		timeout := true ].
	end := DateAndTime now.
	timeout ifTrue: [ 
		^ TypMethodMeasurement
			  method: aMethod
			  duration: end - start
			  process: process ].
	error ifNotNil: [ 
		^ TypMethodMeasurement
			  method: aMethod
			  duration: end - start
			  error: error ].
	^ TypMethodMeasurement
		  method: aMethod
		  duration: end - start
		  result: result
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
