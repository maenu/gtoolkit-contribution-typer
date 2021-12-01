Extension { #name : #SuperVariable }

{ #category : #'*Typer-Inference' }
SuperVariable >> typInfType: aNode in: aContext [

	aContext self hasSuperType ifTrue: [ ^ aContext self superType ].
	^ aContext unknown: aNode
]
