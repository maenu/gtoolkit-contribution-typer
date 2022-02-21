Class {
	#name : #TypInfFlowBlock,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
	#category : #'Typer-Inference-Flow'
}

{ #category : #execution }
TypInfFlowBlock >> execute [

	^ self outgoingAt: #execute
]

{ #category : #execution }
TypInfFlowBlock >> execute: aNode [

	^ self outgoingAt: #execute put: aNode
]
