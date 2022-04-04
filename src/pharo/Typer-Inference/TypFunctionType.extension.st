Extension { #name : #TypFunctionType }

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfRotate: aMessageNode [

	rotater ifNil: [ ^ self ].
	rotater cull: aMessageNode cull: self
]

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfRotater: aBlock [

	rotater := aBlock
]
