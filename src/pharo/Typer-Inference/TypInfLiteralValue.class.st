Class {
	#name : #TypInfLiteralValue,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLiteralValue >> transfer [
	state at: self put: node value typInfType
]
