Class {
	#name : #TypInfConstrainEdge,
	#superclass : #TypInfEdge,
	#instVars : [
		'type'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfConstrainEdge class >> origin: aNode target: anotherNode [
	^ self
		origin: aNode
		target: anotherNode
		key: #constrain
]

{ #category : #accessing }
TypInfConstrainEdge >> type [
	^ type
]

{ #category : #accessing }
TypInfConstrainEdge >> type: aType [
	type := aType
]
