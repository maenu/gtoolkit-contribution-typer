Class {
	#name : #TypInfFlowVariable,
	#superclass : #TypInfFlowNode,
	#category : #'Typer-Inference-Flow'
}

{ #category : #'meta-object-protocol' }
TypInfFlowVariable >> read [

	^ self incomingAt: #read
]

{ #category : #'meta-object-protocol' }
TypInfFlowVariable >> read: aNode [

	^ self incomingAt: #read put: aNode
]
