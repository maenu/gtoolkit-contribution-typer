Class {
	#name : #TypInfLiteralValue,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLiteralValue >> initialize: aState [
	super initialize: aState.
	state at: self put: node value typInfType
]
