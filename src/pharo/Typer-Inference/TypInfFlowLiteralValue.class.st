Class {
	#name : #TypInfFlowLiteralValue,
	#superclass : #TypInfFlowNode,
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowLiteralValue >> initialValueIn: aState [

	^ node value typInfType
]
