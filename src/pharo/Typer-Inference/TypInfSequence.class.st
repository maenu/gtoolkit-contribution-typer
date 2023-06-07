Class {
	#name : #TypInfSequence,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSequence >> initialize: aState [

	super initialize: aState.
	^ state at: self put: TypNilType instance
]

{ #category : #accessing }
TypInfSequence >> transfer [

	self incomingArguments do: [ :e | 
		state at: e put: TypNilType instance ]
]
