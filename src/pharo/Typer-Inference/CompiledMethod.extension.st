Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfType [
	^ self ast typInfType
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypeIn: aType [
	^ self ast typInfTypeIn: aType
]
