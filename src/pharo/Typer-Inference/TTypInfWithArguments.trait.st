Trait {
	#name : #TTypInfWithArguments,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TTypInfWithArguments >> argumentAt: anInteger [

	^ self incomingAt: anInteger
]

{ #category : #accessing }
TTypInfWithArguments >> argumentAt: anInteger put: aNode [

	^ self incomingAt: anInteger put: aNode
]

{ #category : #accessing }
TTypInfWithArguments >> arguments [

	^ (self incoming select: [ :e | e key isInteger ]) sorted collect:
		  #origin
]

{ #category : #accessing }
TTypInfWithArguments >> arguments: aCollection [

	^ aCollection withIndexDo: [ :n :i | self argumentAt: i put: n ]
]
