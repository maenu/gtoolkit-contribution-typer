Class {
	#name : #TypInfAssignment,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfAssignment >> transfer [

	| type |
	(state at: self) isUnknown ifFalse: [ ^ self ].
	type := state at: self incomingNext.
	state at: self put: type.
	self constrain: self outgoingNext to: type
]
