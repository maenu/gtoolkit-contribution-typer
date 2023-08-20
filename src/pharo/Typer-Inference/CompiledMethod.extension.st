Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfRun: aDuration [
	| promise start semaphore process error timeout context |
	promise := AsyncPendingPromise new.
	start := DateAndTime now.
	timeout := false.
	semaphore := Semaphore new.
	context := TypInfContext
			sender: nil
			state: TypInfState new
			node: self ast
			self: self methodClass typAsType
			super: self methodClass typAsType superOrNil.
	process := [ [ [ context run ]
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
								tally: nil) ]
				ifNotNil: [ promise
						fulfillWithValue: (TypMethodMeasurement
								method: self
								duration: DateAndTime now - start
								error: error
								tally: nil) ] ]
		onTimeout: [ process suspend.
			timeout := true.
			promise
				fulfillWithValue: (TypMethodMeasurement
						method: self
						duration: DateAndTime now - start
						process: process
						tally: nil) ] ] forkAt: Processor userBackgroundPriority.
	^ promise
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfRunAndMonitor: aDuration [
	| promise start semaphore process error timeout context tally |
	promise := AsyncPendingPromise new.
	start := DateAndTime now.
	timeout := false.
	semaphore := Semaphore new.
	tally := MessageTally new.
	context := TypInfContext
			sender: nil
			state: TypInfState new
			node: self ast
			self: self methodClass typAsType
			super: self methodClass typAsType superOrNil.
	process := [ [ [ tally spyEvery: 1 on: [ context run ] ]
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
								tally: tally) ]
				ifNotNil: [ promise
						fulfillWithValue: (TypMethodMeasurement
								method: self
								duration: DateAndTime now - start
								error: error
								tally: tally) ] ]
		onTimeout: [ process suspend.
			timeout := true.
			promise
				fulfillWithValue: (TypMethodMeasurement
						method: self
						duration: DateAndTime now - start
						process: process
						tally: tally) ] ] forkAt: Processor userBackgroundPriority.
	^ promise
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypes [

	^ { Integer typAsType }
]
