Extension { #name : #LiteralVariable }

{ #category : #'*Typer-Inference' }
LiteralVariable >> typInfType [
	^ self class
		typAsParametricTypeWithParameters: {#B -> Symbol typAsType.
				#A -> value typInfType}
]
