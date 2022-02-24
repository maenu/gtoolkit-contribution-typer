Class {
	#name : #TypInfFlowAssign,
	#superclass : #TypInfFlowNode,
	#category : #'Typer-Inference-Flow'
}

{ #category : #'as yet unclassified' }
TypInfFlowAssign >> transfer [

	| type variable |
	type := state at: (self incomingAt: #next).
	variable := self outgoingAt: #next.
	state at: variable read put: type.
	state at: variable put: type.
	state at: self put: type
]
