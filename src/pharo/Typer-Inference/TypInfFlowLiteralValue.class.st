Class {
	#name : #TypInfFlowLiteralValue,
	#superclass : #TypInfFlowNode,
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowLiteralValue >> initialize: aState [

	^ node value typInfType
]
