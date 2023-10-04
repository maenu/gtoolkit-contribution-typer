Extension { #name : #TypParametricType }

{ #category : #'*Typer-Dynamic' }
TypParametricType >> typDynWithoutUnion [

	^ self withParameters:
		  (parameters values collect: #typDynWithoutUnion)
]

{ #category : #'*Typer-Dynamic' }
TypParametricType >> typDynWithoutUnknown [

	^ self withParameters:
		  (parameters values collect: #typDynWithoutUnknown)
]
