Extension { #name : #BlockClosure }

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsCanResolveMethodOnDo: aMessageNode [
	<typInfAbsCanResolveMethod: #on:do:>
	^ aMessageNode receiver typInfHasNode
		and: [ ([ | exception |
			exception := (aMessageNode inArgumentAt: 1) node evaluate.
			(exception isKindOf: Exception class)
				or: [ exception isKindOf: ExceptionSet class ] ] on: Error do: [ false ])
				and: [ aMessageNode arguments second typInfHasNode ] ]
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsCanResolveMethodValue: aMessageNode [
	<typInfAbsCanResolveMethod: #value>
	^ aMessageNode receiver typInfHasNode
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsResolveMethodOnDo: aMessageNode [
	<typInfAbsResolveMethod: #on:do:>
	| receiver exception exceptionHandler |
	receiver := aMessageNode receiver typInfNode.
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
		exceptionHandler: exceptionHandler typInfNode
]

{ #category : #'*Typer-Inference' }
BlockClosure >> typInfAbsResolveMethodValue: aMessageNode [
	<typInfAbsResolveMethod: #value>
	| block |
	block := aMessageNode receiver typInfNode.
	^ TypInfBlockContext
		sender: aMessageNode context
		state: aMessageNode state copy
		node: block node
		self: block context self
		super: block context super
		message: aMessageNode
		block: block
]
