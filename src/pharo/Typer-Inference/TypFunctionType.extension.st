Extension { #name : #TypFunctionType }

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfNode: aNode [
	self
		outAt: #typInfNode
		ifPresent: [ :n | Error signal: 'typInfNode is immutable' ]
		ifAbsent: [ self outAt: #typInfNode put: aNode ]
]
