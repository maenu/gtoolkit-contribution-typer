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
TypInfLocal >> tighten: aType in: aState [

	aState tightenFrom: self to: self incomingRead with: aType
]

{ #category : #'as yet unclassified' }
TypInfLocal >> transfer [

	state
		at: self
		put: ((state at: self) tighten: (state at: self incomingRead))
]
