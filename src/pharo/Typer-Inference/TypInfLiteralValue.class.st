Class {
	#name : #TypInfLiteralValue,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLiteralValue >> initialize: aState [

	aState at: self put: node value typInfType
]
