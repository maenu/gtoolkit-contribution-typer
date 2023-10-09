Extension { #name : #BlockClosure }

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsCanResolveOnDo: aMessageNode [
	<typInfAbsCanResolve: #on:do:>
	^ aMessageNode receiver hasNode
		and: [ ([ | exception |
			exception := (aMessageNode inArgumentAt: 1) node evaluate.
			(exception isKindOf: Exception class)
				or: [ exception isKindOf: ExceptionSet class ] ] on: Error do: [ false ])
				and: [ aMessageNode arguments second hasNode ] ]
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsCanResolveValue: aMessageNode [
	<typInfAbsCanResolve: #value>
	<typInfAbsCanResolve: #value:>
	<typInfAbsCanResolve: #value:value:>
	<typInfAbsCanResolve: #value:value:value:>
	<typInfAbsCanResolve: #value:value:value:value:>
	^ aMessageNode receiver hasNode
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsResolveOnDo: aMessageNode [
	<typInfAbsResolve: #on:do:>
	| receiver exception exceptionHandler |
	receiver := aMessageNode receiver node.
	exception := (aMessageNode inArgumentAt: 1) node evaluate.
	exceptionHandler := aMessageNode arguments second.
	^ TypInfExceptionHandlingBlockContext
		sender: aMessageNode context
		state: aMessageNode state copy
		node: receiver node
		self: receiver context self
		super: receiver context super
		message: aMessageNode
		block: receiver
		exception: exception
		exceptionHandler: exceptionHandler node
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsResolveValue: aMessageNode [
	<typInfAbsResolve: #value>
	<typInfAbsResolve: #value:>
	<typInfAbsResolve: #value:value:>
	<typInfAbsResolve: #value:value:value:>
	<typInfAbsResolve: #value:value:value:value:>
	| block |
	block := aMessageNode receiver node.
	^ TypInfBlockContext
		sender: aMessageNode context
		state: aMessageNode state copy
		node: block node
		self: block context self
		super: block context super
		message: aMessageNode
		block: block
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfValueAsyncFor: aDuration [
	| promise semaphore process |
	promise := AsyncPendingPromise new.
	semaphore := Semaphore new.
	process := [ [ [ promise fulfillWithValue: self value ]
			on: Error
			do: [ :e | promise rejectWithError: e ] ] ]
			forkAt: Processor userBackgroundPriority - 1.
	[ semaphore
		wait: aDuration
		onCompletion: [ self assert: [ promise isSettled ] ]
		onTimeout: [ process suspend.
			process
				suspendedContext: ([ Error signal: 'timeout' ] asContext
						privSender: process suspendedContext;
						yourself).
			process priority: (Processor lowIOPriority min: process priority + 5).
			process resume ] ] forkAt: Processor userBackgroundPriority - 1.
	^ promise
]
