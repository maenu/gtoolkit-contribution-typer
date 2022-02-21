Class {
	#name : #TypInfFlowMethod,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
	#category : #'Typer-Inference-Flow'
}

{ #category : #execution }
TypInfFlowMethod >> execute [

	^ self outgoingAt: #execute
]

{ #category : #execution }
TypInfFlowMethod >> execute: aNode [

	^ self outgoingAt: #execute put: aNode
]
