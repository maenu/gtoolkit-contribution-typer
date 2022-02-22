Class {
	#name : #TypInfFlowAssign,
	#superclass : #TypInfFlowNode,
	#category : #'Typer-Inference-Flow'
}

{ #category : #'as yet unclassified' }
TypInfFlowAssign >> type [

	^ state at: self write node variable put: (self incoming: #next) type
]

{ #category : #writing }
TypInfFlowAssign >> write [

	^ self outgoingAt: #write
]

{ #category : #writing }
TypInfFlowAssign >> write: aNode [

	^ self outgoingAt: #write put: aNode
]
