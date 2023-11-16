Class {
	#name : #TypInfError,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfError >> transfer [
	self put: TypUnknownType instance
]
