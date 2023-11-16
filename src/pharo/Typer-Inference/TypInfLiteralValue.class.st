Class {
	#name : #TypInfLiteralValue,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLiteralValue >> transfer [
	self put: node value typInfType
]
