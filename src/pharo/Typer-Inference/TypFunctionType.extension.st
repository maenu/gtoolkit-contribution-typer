Extension { #name : #TypFunctionType }

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfNode: aNode [
	self
		outgoingAt: #typInfNode
		ifPresent: [ :n | Error signal: 'typInfNode is immutable' ]
		ifAbsent: [ self outgoingAt: #typInfNode put: aNode ]
]

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfRotate: aMessageNode [

	rotater ifNil: [ ^ self ].
	rotater cull: aMessageNode cull: self
]

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfRotater: aBlock [

	rotater := aBlock
]
