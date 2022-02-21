Trait {
	#name : #TTypInfFlowWithArguments,
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TTypInfFlowWithArguments >> argumentAt: anInteger [

	^ self incomingAt: anInteger
]

{ #category : #accessing }
TTypInfFlowWithArguments >> argumentAt: anInteger put: aNode [

	^ self incomingAt: anInteger put: aNode
]

{ #category : #accessing }
TTypInfFlowWithArguments >> arguments [

	^ (self incoming select: [ :e | e data isInteger ]) sorted
]

{ #category : #accessing }
TTypInfFlowWithArguments >> arguments: aCollection [

	^ aCollection withIndexDo: [ :n :i | self argumentAt: i put: n ]
]
