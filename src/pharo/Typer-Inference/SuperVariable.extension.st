Extension { #name : #SuperVariable }

{ #category : #'*Typer-Inference' }
SuperVariable >> typInfType: aNode in: aContext [

	aContext self hasSuper ifTrue: [ ^ aContext self super ].
	^ aContext unknown: aNode
]
