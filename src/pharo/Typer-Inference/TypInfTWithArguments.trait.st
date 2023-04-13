Trait {
	#name : #TypInfTWithArguments,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfTWithArguments >> incomingArgumentAt: anInteger [

	^ self incomingAt: anInteger
]

{ #category : #accessing }
TypInfTWithArguments >> incomingArgumentAt: anInteger put: aNode [

	^ self incomingAt: anInteger put: aNode
]

{ #category : #accessing }
TypInfTWithArguments >> incomingArguments [

	^ (self incomingEdges select: [ :e | e key isInteger ]) sorted collect:
		  #origin
]

{ #category : #accessing }
TypInfTWithArguments >> incomingArguments: aCollection [

	^ aCollection withIndexDo: [ :n :i | 
		  self incomingArgumentAt: i put: n ]
]
