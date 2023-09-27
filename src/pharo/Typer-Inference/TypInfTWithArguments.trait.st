Trait {
	#name : #TypInfTWithArguments,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfTWithArguments >> inArgumentAt: anInteger [

	^ self inAt: anInteger
]

{ #category : #accessing }
TypInfTWithArguments >> inArgumentAt: anInteger put: aNode [

	^ self inAt: anInteger put: aNode
]

{ #category : #accessing }
TypInfTWithArguments >> inArguments [

	^ (self inEdges select: [ :e | e key isInteger ]) sorted collect:
		  #origin
]

{ #category : #accessing }
TypInfTWithArguments >> inArguments: aCollection [
	^ aCollection
		withIndexDo: [ :n :i | 
			self assert: [ n isKindOf: TypInfNode ].
			self inArgumentAt: i put: n ]
]
