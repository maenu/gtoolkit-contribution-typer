Extension { #name : #BlockClosure }

{ #category : #'*Typer-Core' }
BlockClosure >> typAsAsyncFuture [
	| configuration |
	configuration := TypInfCurrentConfiguration value.
	^ [ TypInfIsAsync
		do: [ TypInfCurrentConfiguration value: configuration during: self ] ]
		asAsyncFuture
]

{ #category : #'*Typer-Core' }
BlockClosure >> typRunAtMost: aDuration onCompletion: aBlock onTimeout: anotherBlock [
	| semaphore process result exception |
	semaphore := Semaphore new.
	process := [ [ [ result := self value ]
			on: Exception
			do: [ :e | exception := e ] ] ensure: [ semaphore signal ] ]
			forkAt: Processor activePriority - 1
			named: 'typRunAtMost:onCompletion:onTimeout:'.
	^ semaphore
		wait: 1 minute
		onCompletion: [ aBlock value: result value: exception ]
		onTimeout: [ process terminate.
			anotherBlock value ]
]
