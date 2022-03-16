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
TypInfLocal >> tightenTo: aType in: aState [

	self tighten: self incomingRead to: aType in: aState
]

{ #category : #'as yet unclassified' }
TypInfLocal >> transfer [

	state
		at: self
		put: ((state at: self) tighten: (state at: self incomingRead)).
	super transfer
]
