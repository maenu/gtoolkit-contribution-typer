Extension { #name : #TypType }

{ #category : #'*Typer-Inference' }
TypType >> typInfAbstractInterpret: aMessageNode [
	^ false
]

{ #category : #'*Typer-Inference' }
TypType >> typInfNode [
	^ self outgoingAt: #typInfNode
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
