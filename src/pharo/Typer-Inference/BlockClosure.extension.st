Extension { #name : #BlockClosure }

{ #category : #'*Typer-Inference' }
BlockClosure class >> typInfAbstractInterpretValue: aMessageNode [
	<typInfAbstractInterpret: #value>
	| receiver block |
	receiver := aMessageNode receiver.
	receiver
		outAt: #typInfNode
		ifPresent: [ :n | block := n ]
		ifAbsent: [ ^ false ].
	TypInfMethodNodeStack
		push: block
		max: 8
		during: [ | inline |
			"Halt now."
			inline := TypInfBlockContext
					sender: aMessageNode context
					state: aMessageNode state copy
					node: block node
					self: block context self
					super: block context super
					message: aMessageNode
					block: block.
			inline visit.
			self flag: 'TODO use receiver,args as key, invalidate?'.
			aMessageNode outAt: #abstractInterpret put: inline ]
		or: [ "Halt now" ].
	^ true
]
