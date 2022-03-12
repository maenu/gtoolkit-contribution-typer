Class {
	#name : #TypInfSequence,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSequence >> initialize: aState [

	state := aState.
	^ state at: self put: TypNilType instance
]

{ #category : #accessing }
TypInfSequence >> transfer [

	(state at: self) isUnknown ifFalse: [ ^ self ].
	self incomingArguments do: [ :e | 
		state at: e put: TypNilType instance ]
]
