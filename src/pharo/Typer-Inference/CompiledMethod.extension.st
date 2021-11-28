Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfSelf [

	^ self methodClass typAsType
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypeSelf: aType [
	^ self ast typInfTypeSelf: aType
]
