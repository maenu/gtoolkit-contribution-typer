Extension { #name : #TAsyncFuture }

{ #category : #'*Typer-Core' }
TAsyncFuture >> typAwait [
	| promise |
	promise := AsyncPendingFuturePromise new
			group: (AsyncFutureExecutionValueGroup new
					value: #Typer;
					yourself);
			future: self;
			yourself.
	TypManifest threadPool schedule: promise.
	^ promise
]

{ #category : #'*Typer-Core' }
TAsyncFuture >> typAwaitFor: aDuration [
	| semaphore promise |
	semaphore := Semaphore new.
	promise := self typAwait.
	[ semaphore
		wait: aDuration
		onCompletion: [ self assert: [ promise isSettled ] ]
		onTimeout: [ promise cancelHard ] ]
		forkAt: Processor userBackgroundPriority - 1.
	^ promise
		then: [ :r | 
			semaphore signal.
			r ]
		otherwise: [ :e | 
			semaphore signal.
			e ]
]