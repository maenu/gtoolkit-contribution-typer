Extension { #name : #TypFunctionType }

{ #category : #'*Typer-Inference' }
TypFunctionType >> typInfNode: aNode [
	self
		outAt: #typInfNode
		ifPresent: [ :n | Error signal: 'typInfNode is immutable' ]
		ifAbsent: [ aNode in at: #typInfNode ifPresent: [ :s | s copy do: #remove ].	"remove all old edges"
			self outAt: #typInfNode put: aNode ]
]
