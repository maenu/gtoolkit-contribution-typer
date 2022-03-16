Class {
	#name : #TypInfCascade,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfCascade >> transfer [

	state at: self put: (state at: self incomingNext).
	super transfer
]
