Class {
	#name : #TypInfSequence,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSequence >> transfer [
	self inArguments do: [ :e | state at: e put: TypNilType instance ].
	self put: TypNilType instance
]
