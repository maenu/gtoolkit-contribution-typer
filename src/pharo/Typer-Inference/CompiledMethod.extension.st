Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAbsCanResolve [
	self assert: [ self typInfAbsIsCanResolve ].
	^ (self pragmas detect: [ :e | e selector = #typInfAbsCanResolve: ]) arguments
		first asSymbol
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAbsIsCanResolve [
	^ self hasPragmaNamed: #typInfAbsCanResolve:
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAbsIsResolve [
	^ self hasPragmaNamed: #typInfAbsResolve:
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAbsResolve [
	self assert: [ self typInfAbsIsResolve ].
	^ (self pragmas detect: [ :e | e selector = #typInfAbsResolve: ])
		arguments first asSymbol
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAsLookup [
	^ TypMethodLookup
		receiver: self methodClass typAsType
		selector: self selector
		arguments: (self selector numArgs typTimesCollect: [ TypUnknownType instance ])
		parent: nil
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAsLookupSelf: aType super: anotherType [
	^ TypMethodLookup
		receiver: self methodClass typAsType
		selector: self selector
		arguments: (self selector numArgs typTimesCollect: [ TypUnknownType instance ])
		self: aType
		super: anotherType
		parent: nil
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfRun [
	^ self typInfRunVariant: #run
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfRun: aDuration [
	^ self typInfRunVariant: #run duration: aDuration
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfRunAndMonitor: aDuration [
	| tally |
	tally := MessageTally new.
	^ (self
		typInfRunVariant: [ :c | 
			tally spyEvery: 1 on: [ c run ].
			c ]
		duration: aDuration)
		then: [ :m | 
			m
				tally: tally;
				yourself ]
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfRunVariant: aBlock [
	| selfType node key context |
	selfType := self methodClass typAsType.
	node := self ast.
	key := TypInfContextKey
			node: node
			self: selfType
			super: selfType superOrNil.
	TypInfMethodResolver instance outRemoveAt: key.
	context := TypInfContext
			sender: nil
			state: TypInfState new
			node: node
			self: selfType
			super: selfType superOrNil.
	TypInfMethodResolver instance outAt: key put: context.
	TypInfNodeStack
		push: node
		during: [ [ aBlock value: context ]
				ifCurtailed: [ TypInfMethodResolver instance outRemoveAt: key ] ]
		or: [ self error: 'node stack reached max size' ].
	^ context
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfRunVariant: aBlock duration: aDuration [
	| promise start semaphore process error context |
	promise := AsyncPendingPromise new.
	start := DateAndTime now.
	semaphore := Semaphore new.
	process := [ [ context := self typInfRunVariant: aBlock ]
			on: Exception - OCUndeclaredVariableWarning - OCShadowVariableWarning
			do: [ :e | 
				e freeze.
				error := e ] ] forkAt: Processor userBackgroundPriority.
	[ semaphore
		wait: aDuration
		onCompletion: [ error
				ifNil: [ promise
						fulfillWithValue: (TypMethodMeasurement
								method: self
								duration: DateAndTime now - start
								result: context
								error: nil
								process: process
								tally: nil) ]
				ifNotNil: [ promise
						fulfillWithValue: (TypMethodMeasurement
								method: self
								duration: DateAndTime now - start
								result: context
								error: error
								process: process
								tally: nil) ] ]
		onTimeout: [ process suspend.
			promise
				fulfillWithValue: (TypMethodMeasurement
						method: self
						duration: DateAndTime now - start
						result: context
						error: (Error new
								messageText: 'timeout';
								yourself)
						process: process
						tally: nil) ] ] forkAt: Processor userBackgroundPriority.
	^ promise
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfType [
	^ self class
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: (self numArgs timesCollect: [ TypUnknownType instance ])
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypes [

	^ { Integer typAsType }
]
