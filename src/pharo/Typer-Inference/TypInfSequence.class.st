Class {
	#name : #TypInfSequence,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSequence >> initialize: aState [

	^ aState at: self put: TypNilType instance
]
