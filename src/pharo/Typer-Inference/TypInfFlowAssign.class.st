Class {
	#name : #TypInfFlowAssign,
	#superclass : #TypInfFlowNode,
	#category : #'Typer-Inference-Flow'
}

{ #category : #'as yet unclassified' }
TypInfFlowAssign >> transfer: aState [

	| type |
	type := aState at: (self incomingAt: #next).
	aState at: self write put: type.
	aState at: self put: type
]

{ #category : #writing }
TypInfFlowAssign >> write [

	^ self outgoingAt: #write
]

{ #category : #writing }
TypInfFlowAssign >> write: aNode [

	^ self outgoingAt: #write put: aNode
]
