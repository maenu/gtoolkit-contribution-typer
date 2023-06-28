Class {
	#name : #TypInfAssignment,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfAssignment >> transfer [

	| value |
	value := state at: self inNext.
	state at: self put: value.
	state covariantFrom: self to: self outNext with: value
]
