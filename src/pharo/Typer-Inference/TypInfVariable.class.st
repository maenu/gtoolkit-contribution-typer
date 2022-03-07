Class {
	#name : #TypInfVariable,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfVariable >> constrain: aNode to: aType in: aState [

	| type |
	type := super constrain: aNode to: aType in: aState.
	aNode == self ifFalse: [ ^ type ].
	^ node variable typInfConstrain: self to: type in: aState
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
	^ node variable typInfInitialize: self in: state
]

{ #category : #'as yet unclassified' }
TypInfVariable >> outgoingReads [

	^ (outgoing at: #read) collect: #target
]

{ #category : #private }
TypInfVariable >> transfer [

	node variable typInfTransfer: self in: state
]
