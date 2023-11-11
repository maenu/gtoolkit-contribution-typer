Class {
	#name : #TypInfAssignment,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfAssignment >> transfer [
	state at: self put: self previous
]
