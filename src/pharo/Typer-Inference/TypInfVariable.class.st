Class {
	#name : #TypInfVariable,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfVariable >> constrainTo: aType in: aState [

	node variable typInfFlowConstrain: self to: aType in: aState
]

{ #category : #accessing }
TypInfVariable >> initialize: aState [

	^ node variable typInfFlowInitialize: self in: aState
]

{ #category : #'meta-object-protocol' }
TypInfVariable >> read [

	^ self incomingAt: #read ifPresent: #yourself ifAbsent: [ self ]
]

{ #category : #'meta-object-protocol' }
TypInfVariable >> read: aNode [

	^ self incomingAt: #read put: aNode
]

{ #category : #private }
TypInfVariable >> transfer [

	node variable typInfFlowTransfer: self in: state
]
