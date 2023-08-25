Class {
	#name : #TypInfAssignment,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfAssignment >> transfer [
	| previous |
	previous := self previous.
	state at: self put: previous.
	(out at: #next) do: [ :e | state at: e target node variable put: previous ]
]
