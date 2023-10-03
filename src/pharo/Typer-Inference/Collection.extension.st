Extension { #name : #Collection }

{ #category : #'*Typer-Inference' }
Collection >> typInfType [

	^ self class typAsType withParameters:
		  { self typInfTypes typAsType }
]

{ #category : #'*Typer-Inference' }
Collection >> typInfTypes [

	self size < 128 ifTrue: [ 
		^ self collect: #typInfType as: Array ].
	^ 128 typTimesCollect: [ :i | self atRandom typInfType ]
]
