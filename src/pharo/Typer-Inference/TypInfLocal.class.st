Class {
	#name : #TypInfLocal,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfLocal >> constrainTo: aType [

	self constrain: self incomingRead to: aType
]

{ #category : #'meta-object-protocol' }
TypInfLocal >> incomingRead [

	^ self incomingAt: #read
]

{ #category : #'meta-object-protocol' }
TypInfLocal >> incomingRead: aNode [

	^ self incomingAt: #read put: aNode
]

{ #category : #'as yet unclassified' }
TypInfLocal >> set: aType in: aState [

	super set: aType in: aState.
	self incomingRead set: (aState at: self) in: aState
]

{ #category : #'as yet unclassified' }
TypInfLocal >> transfer [

	(state at: self) isUnknown ifFalse: [ ^ self ].
	state at: self put: (state at: self incomingRead)
]
