Class {
	#name : #TypInfCascade,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfCascade >> transfer [

	(state at: self) isUnknown ifFalse: [ ^ self ].
	state at: self put: (state at: self incomingNext)
]
