Class {
	#name : #TypInfError,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfError >> transfer [
	state at: self put: TypUnknownType instance
]
