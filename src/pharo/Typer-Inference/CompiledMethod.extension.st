Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfOverriddingMethods [
	"all the methods of my superclasses that are overriding me"

	| selector |
	selector := self selector.
	^ self methodClass allSubclasses
		select: [ :class | class includesSelector: selector ]
		thenCollect: [ :class | class compiledMethodAt: selector ]
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfRunAndMonitor [
	| promise start semaphore process error timeout result tally |
	promise := AsyncPendingPromise new.
	start := DateAndTime now.
	timeout := false.
	semaphore := Semaphore new.
	tally := MessageTally new.
	process := [ [ [ tally spyEvery: 1 on: [ result := self ast typInfTypeSelf ] ]
			on: Exception - OCUndeclaredVariableWarning - OCShadowVariableWarning
			do: [ :e | 
				e freeze.
				error := e ] ] ensure: [ semaphore signal ] ]
			forkAt: Processor userBackgroundPriority.
	^ [ semaphore
		wait: 2 minutes
		onCompletion: [ error
				ifNil: [ TypMethodMeasurement
						method: self
						duration: DateAndTime now - start
						result: result
						tally: tally ]
				ifNotNil: [ TypMethodMeasurement
						method: self
						duration: DateAndTime now - start
						error: error
						tally: tally ] ]
		onTimeout: [ process suspend.
			timeout := true.
			TypMethodMeasurement
				method: self
				duration: DateAndTime now - start
				process: process
				tally: tally ] ] asAsyncFuture
		await: AsyncFutureExecutionConfiguration new lowPriority
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypes [

	^ { Integer typAsType }
]
