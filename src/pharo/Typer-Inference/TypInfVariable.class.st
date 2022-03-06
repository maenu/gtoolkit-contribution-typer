Class {
	#name : #TypInfVariable,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfVariable >> constrainTo: aType [

	super constrainTo: aType.
	node variable typInfFlowConstrain: self to: aType
]

{ #category : #'meta-object-protocol' }
TypInfVariable >> incomingRead [

	^ self incomingAt: #read
]

{ #category : #'meta-object-protocol' }
TypInfVariable >> incomingRead: aNode [

	^ self incomingAt: #read put: aNode
]

{ #category : #accessing }
TypInfVariable >> initialize: aState [

	state := aState.
	^ node variable typInfFlowInitialize: self in: state
]

{ #category : #'as yet unclassified' }
TypInfVariable >> outgoingReads [

	^ (outgoing at: #read) collect: #target
]

{ #category : #'meta-object-protocol' }
TypInfVariable >> readIfPresent: aBlock ifAbsent: anotherBlock [

	^ self incomingAt: #read ifPresent: aBlock ifAbsent: anotherBlock
]

{ #category : #private }
TypInfVariable >> transfer [

	node variable typInfFlowTransfer: self in: state
]
