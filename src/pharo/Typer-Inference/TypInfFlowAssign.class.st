Class {
	#name : #TypInfFlowAssign,
	#superclass : #TypInfFlowNode,
	#category : #'Typer-Inference-Flow'
}

{ #category : #writing }
TypInfFlowAssign >> write [

	^ self outgoingAt: #write
]

{ #category : #writing }
TypInfFlowAssign >> write: aNode [

	^ self outgoingAt: #write put: aNode
]
