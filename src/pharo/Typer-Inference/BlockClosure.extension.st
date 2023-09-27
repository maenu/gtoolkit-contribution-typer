Extension { #name : #BlockClosure }

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsCanResolveMethodOnDo: aMessageNode [
	<typInfAbsCanResolveMethod: #on:do:>
	^ aMessageNode receiver hasNode
		and: [ ([ | exception |
			exception := (aMessageNode inArgumentAt: 1) node evaluate.
			(exception isKindOf: Exception class)
				or: [ exception isKindOf: ExceptionSet class ] ] on: Error do: [ false ])
				and: [ aMessageNode arguments second hasNode ] ]
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsCanResolveMethodValue: aMessageNode [
	<typInfAbsCanResolveMethod: #value>
	^ aMessageNode receiver hasNode
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsResolveMethodOnDo: aMessageNode [
	<typInfAbsResolveMethod: #on:do:>
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
BlockClosure >> typInfAbsResolveMethodValue: aMessageNode [
	<typInfAbsResolveMethod: #value>
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
