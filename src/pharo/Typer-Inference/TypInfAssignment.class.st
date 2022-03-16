Class {
	#name : #TypInfAssignment,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfAssignment >> transfer [

	state at: self put: (state at: self incomingNext).
	self tighten: self outgoingNext to: (state at: self) in: state.
	super transfer
]
