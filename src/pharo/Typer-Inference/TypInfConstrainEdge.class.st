Class {
	#name : #TypInfConstrainEdge,
	#superclass : #TypInfEdge,
	#instVars : [
		'type'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfConstrainEdge class >> origin: aNode target: anotherNode type: aType [

	^ (self origin: aNode target: anotherNode key: #constrain)
		  type: aType;
		  yourself
]

{ #category : #generated }
TypInfConstrainEdge >> type [

	^ type
]

{ #category : #generated }
TypInfConstrainEdge >> type: aType [

	type := aType
]
