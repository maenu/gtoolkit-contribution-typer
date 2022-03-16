Class {
	#name : #TypInfReturnEdge,
	#superclass : #TypInfTightenEdge,
	#category : #'Typer-Inference-Core'
}

{ #category : #testing }
TypInfReturnEdge >> isReturn [

	^ true
]

{ #category : #initialization }
TypInfReturnEdge >> set: aType in: aState [

	^ aState at: self put: (type := type withParameters:
			           { aType }
			           ,
			           (target incomingArguments collect: [ :n | aState at: n ]))
]
