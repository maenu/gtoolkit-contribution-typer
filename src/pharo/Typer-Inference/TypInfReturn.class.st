Class {
	#name : #TypInfReturn,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfReturn >> transfer [

	state at: self put: (state at: self incomingNext).
	super transfer
]
