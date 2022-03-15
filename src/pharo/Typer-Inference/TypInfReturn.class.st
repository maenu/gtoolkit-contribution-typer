Class {
	#name : #TypInfReturn,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfReturn >> transfer [

	| type |
	type := state at: self.
	state at: self put: (state at: self incomingNext).
	TypInfSignal
		emitMessage: 'transfer'
		from: type
		to: (state at: self)
		node: self
]
