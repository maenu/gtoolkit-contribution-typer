Class {
	#name : #TypInfLocal,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

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
	self incomingRead set: aType in: aState
]

{ #category : #'as yet unclassified' }
TypInfLocal >> transfer [

	| type |
	type := state at: self.
	type isUnknown ifFalse: [ ^ self ].
	type := state at: self incomingRead.
	state at: self put: type
]
