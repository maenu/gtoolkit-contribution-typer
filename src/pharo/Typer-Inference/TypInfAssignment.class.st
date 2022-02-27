Class {
	#name : #TypInfAssignment,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfAssignment >> transfer [

	| value valueType variable variableType |
	value := self incomingAt: #next.
	valueType := state at: value.
	variable := self outgoingAt: #next.
	variableType := state at: variable.
	self flag: 'is this always legal?'.
	value constrainTo: variableType in: state.
	state at: variable read put: valueType.
	state at: variable put: valueType.
	state at: self put: valueType
]
