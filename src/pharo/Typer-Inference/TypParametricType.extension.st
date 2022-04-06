Extension { #name : #TypParametricType }

{ #category : #'*Typer-Inference' }
TypParametricType >> typInfWithoutUnion [

	^ self withParameters:
		  (parameters values collect: #typInfWithoutUnion)
]

{ #category : #'*Typer-Inference' }
TypParametricType >> typInfWithoutUnknown [

	^ self withParameters:
		  (parameters values collect: #typInfWithoutUnknown)
]
