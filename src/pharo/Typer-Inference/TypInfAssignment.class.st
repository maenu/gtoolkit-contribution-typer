Class {
	#name : #TypInfAssignment,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfAssignment >> transfer [

	| typeOld typeNew |
	typeOld := state at: self.
	typeNew := state at: self incomingNext.
	state at: self put: typeNew.
	self constrain: self outgoingNext to: typeNew in: state.
	TypInfSignal
		emitMessage: 'transfer'
		from: typeOld
		to: typeNew
		node: self
]
