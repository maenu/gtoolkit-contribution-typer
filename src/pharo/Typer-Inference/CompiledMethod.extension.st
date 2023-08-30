Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfRun: aDuration [
	| promise start semaphore process error context selfType key |
	promise := AsyncPendingPromise new.
	start := DateAndTime now.
	semaphore := Semaphore new.
	selfType := self methodClass typAsType.
	key := TypInfContextKey
			node: self ast
			self: selfType
			super: selfType superOrNil.
	TypMethodIndex instance outRemoveAt: key.
	context := TypInfContext
			sender: nil
			state: TypInfState new
			node: self ast
			self: selfType
			super: selfType superOrNil.
	process := [ [ [ context run.
		TypMethodIndex instance outAt: key put: context ]
			on: Exception - OCUndeclaredVariableWarning - OCShadowVariableWarning
			do: [ :e | 
				e freeze.
				error := e ] ] ensure: [ semaphore signal ] ]
			forkAt: Processor userBackgroundPriority.
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
CompiledMethod >> typInfRunAndMonitor: aDuration [
	| promise start semaphore process error context key tally selfType |
	promise := AsyncPendingPromise new.
	start := DateAndTime now.
	semaphore := Semaphore new.
	tally := MessageTally new.
	selfType := self methodClass typAsType.
	key := TypInfContextKey
			node: self ast
			self: selfType
			super: selfType superOrNil.
	TypMethodIndex instance outRemoveAt: key.
	context := TypInfContext
			sender: nil
			state: TypInfState new
			node: self ast
			self: selfType
			super: selfType superOrNil.
	process := [ [ [ tally spyEvery: 1 on: [ context run ].
		TypMethodIndex instance outAt: key put: context ]
			on: Exception - OCUndeclaredVariableWarning - OCShadowVariableWarning
			do: [ :e | 
				e freeze.
				error := e ] ] ensure: [ semaphore signal ] ]
			forkAt: Processor userBackgroundPriority.
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
								tally: tally) ]
				ifNotNil: [ promise
						fulfillWithValue: (TypMethodMeasurement
								method: self
								duration: DateAndTime now - start
								result: context
								error: error
								process: process
								tally: tally) ] ]
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
						tally: tally) ] ] forkAt: Processor userBackgroundPriority.
	^ promise
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypes [

	^ { Integer typAsType }
]
