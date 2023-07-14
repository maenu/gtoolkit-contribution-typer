Extension { #name : #BlockClosure }

{ #category : #'*Typer-Inference' }
BlockClosure class >> typInfAbstractInterpretValue: aMessageNode [
	<typInfAbstractInterpret: #value>
	| block |
	self assert: [ self typInfCanAbstractInterpretValue: aMessageNode ].
	block := aMessageNode receiver outAt: #typInfNode.
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
BlockClosure class >> typInfCanAbstractInterpretValue: aMessageNode [
	<typInfCanAbstractInterpret: #value>
	^ aMessageNode receiver
		outAt: #typInfNode
		ifPresent: [ :n | true ]
		ifAbsent: [ false ]
]
