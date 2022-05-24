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

{ #category : #accessing }
TypInfLocal >> transfer [

	(self incomingNext isKindOf: TypInfAssignment) ifTrue: [ 
		^ self tighten: self type in: state ].
	state tighten: self with: (state at: self incomingRead)
]
