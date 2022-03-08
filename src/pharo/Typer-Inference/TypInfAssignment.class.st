Class {
	#name : #TypInfAssignment,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfAssignment >> transfer [

	| value valueType variable variableType |
	value := self incomingNext.
	valueType := state at: value.
	variable := self outgoingNext.
	variableType := state at: variable.
	state at: variable put: valueType.
	state at: self put: valueType.
	self constrain: variable to: valueType
]
