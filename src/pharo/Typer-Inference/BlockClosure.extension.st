Extension { #name : #BlockClosure }

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsCanResolveOnDo: aLookup message: aMessageNode [
	<typInfAbsCanResolve: #on:do:>
	^ aMessageNode receiver hasNode
		and: [ ([ | exception |
			exception := (aMessageNode inArgumentAt: 1) node evaluate.
			(exception isKindOf: Exception class)
				or: [ exception isKindOf: ExceptionSet class ] ] on: Error do: [ false ])
				and: [ aMessageNode arguments second hasNode ] ]
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsCanResolveValue: aLookup message: aMessageNode [
	<typInfAbsCanResolve: #value>
	<typInfAbsCanResolve: #value:>
	<typInfAbsCanResolve: #value:value:>
	<typInfAbsCanResolve: #value:value:value:>
	<typInfAbsCanResolve: #value:value:value:value:>
	^ aMessageNode receiver hasNode
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsResolveOnDo: aLookup message: aMessageNode [
	<typInfAbsResolve: #on:do:>
	| receiver exception exceptionHandler |
	receiver := aMessageNode receiver node.
	exception := (aMessageNode inArgumentAt: 1) node evaluate.
	exceptionHandler := aMessageNode arguments second.
	^ TypInfExceptionHandlingBlockContext
		sender: aMessageNode context
		state: aMessageNode state
		node: receiver node
		lookup: aLookup
		message: aMessageNode
		block: receiver
		exception: exception
		exceptionHandler: exceptionHandler node
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsResolveValue: aLookup message: aMessageNode [
	<typInfAbsResolve: #value>
	<typInfAbsResolve: #value:>
	<typInfAbsResolve: #value:value:>
	<typInfAbsResolve: #value:value:value:>
	<typInfAbsResolve: #value:value:value:value:>
	| block |
	block := aMessageNode receiver node.
	^ TypInfBlockContext
		sender: aMessageNode context
		state: aMessageNode state
		node: block node
		lookup: aLookup
		message: aMessageNode
		block: block
]
