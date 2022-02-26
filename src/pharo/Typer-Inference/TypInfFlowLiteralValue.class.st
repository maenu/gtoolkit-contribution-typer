Class {
	#name : #TypInfFlowLiteralValue,
	#superclass : #TypInfFlowNode,
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowLiteralValue >> initialize: aState [

	aState at: self put: node value typInfType
]
