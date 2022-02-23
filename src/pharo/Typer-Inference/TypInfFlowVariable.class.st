Class {
	#name : #TypInfFlowVariable,
	#superclass : #TypInfFlowNode,
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowVariable >> initialize: aState [

	^ node variable typInfFlowInitialize: aState
]

{ #category : #'meta-object-protocol' }
TypInfFlowVariable >> read [

	^ self incomingAt: #read
]

{ #category : #'meta-object-protocol' }
TypInfFlowVariable >> read: aNode [

	^ self incomingAt: #read put: aNode
]

{ #category : #private }
TypInfFlowVariable >> transfer: aState [

	| type |
	type := self
		        incomingAt: #read
		        ifPresent: [ :e | e node variable typInfFlowTypeIn: aState ]
		        ifAbsent: [ node variable typInfFlowTypeIn: aState ].
	aState at: self put: type
]
