Class {
	#name : #TypInfLocal,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfLocal >> constrainTo: aType in: aState [

	self constrain: self incomingRead to: aType in: aState
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
TypInfLocal >> transfer [

	| type |
	type := state at: self.
	type isUnknown ifFalse: [ ^ self ].
	state at: self put: (state at: self incomingRead).
	TypInfSignal
		emitMessage: 'transfer'
		from: type
		to: (state at: self)
		node: self
]
