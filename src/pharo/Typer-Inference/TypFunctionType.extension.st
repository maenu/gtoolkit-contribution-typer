Extension { #name : #TypFunctionType }

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfHasNode [
	^ out includesKey: #typInfNode
]

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfNode [
	^ self outAt: #typInfNode
]

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfWithNode: aNode [
	self outAt: #typInfNode ifPresent: [ :n | n == aNode ifTrue: [ ^ self ] ].
	^ self copy
		outAt: #typInfNode put: aNode;
		yourself
]
