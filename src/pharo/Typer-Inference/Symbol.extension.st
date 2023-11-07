Extension { #name : #Symbol }

{ #category : #'*Typer-Inference' }
Symbol >> typInfType [

	^ TypValueType super: self class typAsType value: self
]

{ #category : #'*Typer-Inference' }
Symbol >> typInfUnknownArguments [
	^ self numArgs typTimesCollect: [ :i | TypUnknownType instance ]
]
