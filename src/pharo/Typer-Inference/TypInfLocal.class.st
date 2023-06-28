Class {
	#name : #TypInfLocal,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'meta-object-protocol' }
TypInfLocal >> inRead [

	^ self inAt: #read
]

{ #category : #'meta-object-protocol' }
TypInfLocal >> inRead: aNode [

	^ self inAt: #read put: aNode
]

{ #category : #'as yet unclassified' }
TypInfLocal >> tighten: aType in: aState [

	aState covariantFrom: self to: self inRead with: aType
]

{ #category : #accessing }
TypInfLocal >> transfer [

	(self inNext isKindOf: TypInfAssignment) ifTrue: [ 
		^ self tighten: self type in: state ].
	state covariant: self with: (state at: self inRead)
]
