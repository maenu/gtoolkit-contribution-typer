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
