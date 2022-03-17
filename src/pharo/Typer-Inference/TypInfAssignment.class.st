Class {
	#name : #TypInfAssignment,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfAssignment >> transfer [

	| value |
	value := state at: self incomingNext.
	state at: self put: value.
	state tightenFrom: self to: self outgoingNext with: value
]
