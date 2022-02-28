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
