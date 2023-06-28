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

	^ aState at: self put: (type := type == aType
			           ifTrue: [ type ]
			           ifFalse: [ 
				           type withParameters:
					           { aType }
					           ,
					           (target inArguments collect: [ :n | 
						            aState at: n ]) ])
]
