Extension { #name : #TAsyncFuture }

{ #category : #'*Typer-Core' }
TAsyncFuture >> typAwait [
	| promise |
	promise := AsyncFuturePromise new
			priority: AsyncFutureExecutionDefaultPriority uniqueInstance;
			group: (AsyncFutureExecutionValueGroup new
					value: #Typer;
					yourself);
			errorHandler: TypLoggingErrorHandler uniqueInstance;
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
		then: [ semaphore signal.
			promise ]
		otherwise: [ semaphore signal.
			promise ]
]
