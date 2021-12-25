Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypeIn: aContext [
	^ self ast typInfTypeIn: aContext
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypeInSelf [

	^ self ast typInfTypeInSelf
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypes [

	^ { Integer typAsType }
]
