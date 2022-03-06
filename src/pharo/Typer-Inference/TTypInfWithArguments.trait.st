Trait {
	#name : #TTypInfWithArguments,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TTypInfWithArguments >> incomingArgumentAt: anInteger [

	^ self incomingAt: anInteger
]

{ #category : #accessing }
TTypInfWithArguments >> incomingArgumentAt: anInteger put: aNode [

	^ self incomingAt: anInteger put: aNode
]

{ #category : #accessing }
TTypInfWithArguments >> incomingArguments [

	^ (self incoming select: [ :e | e key isInteger ]) sorted collect:
		  #origin
]

{ #category : #accessing }
TTypInfWithArguments >> incomingArguments: aCollection [

	^ aCollection withIndexDo: [ :n :i | 
		  self incomingArgumentAt: i put: n ]
]
