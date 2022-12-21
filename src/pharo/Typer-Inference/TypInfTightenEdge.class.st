Class {
	#name : #TypInfTightenEdge,
	#superclass : #TypInfEdge,
	#instVars : [
		'type'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfTightenEdge class >> origin: aNode target: anotherNode type: aType [

	^ (self origin: aNode target: anotherNode key: #tighten)
		  initializeType: aType;
		  yourself
]

{ #category : #generated }
TypInfTightenEdge >> getIn: aState [

	^ aState
		  at: self
		  ifPresent: [ :t | type covariant: t ]
		  ifAbsent: [ type ]
]

{ #category : #generated }
TypInfTightenEdge >> initializeType: aType [

	type := aType
]

{ #category : #testing }
TypInfTightenEdge >> isTighten [

	^ true
]

{ #category : #generated }
TypInfTightenEdge >> set: aType in: aState [

	^ aState at: self put: (type := type covariant: aType)
]
