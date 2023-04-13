Extension { #name : #TypType }

{ #category : #'*Typer-Inference' }
TypType >> typInfNode [

	^ self outgoingAt: #method ifAbsent: [ nil ]
]

{ #category : #'*Typer-Inference' }
TypType >> typInfRotate: aMessageNode [

	
]

{ #category : #'*Typer-Inference' }
TypType >> typInfWithoutUnion [

	^ self
]

{ #category : #'*Typer-Inference' }
TypType >> typInfWithoutUnknown [

	^ self
]
