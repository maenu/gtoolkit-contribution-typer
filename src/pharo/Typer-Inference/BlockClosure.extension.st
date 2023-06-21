Extension { #name : #BlockClosure }

{ #category : #'*Typer-Inference' }
BlockClosure class >> typInfAbstractInterpretValue: aMessageNode [
	<typInfAbstractInterpret: #value>
	| receiver block |
	receiver := aMessageNode receiver.
	receiver
		outgoingAt: #typInfNode
		ifPresent: [ :n | block := n ]
		ifAbsent: [ ^ self ].
	TypInfMethodNodeStack
		push: block
		max: 8
		during: [  "Halt once."| inline |
			inline := TypInfInlineContext
					sender: aMessageNode context
					state: aMessageNode state copy
					node: block
					self: block context self
					super: block context super
					message: self.
			inline visit.
			self flag: 'TODO use receiver,args as key, invalidate?'.
			block outgoingAt: #abstractInterpret put: inline ]
		or: [  "Halt once" ].
	self flag: 'inject block statements, args, return'
]
