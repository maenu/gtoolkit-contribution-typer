Class {
	#name : #TypInfNodeOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'node'
	],
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfNodeOrigin class >> node: aNode [
	^ self new
		initializeNode: aNode;
		yourself
]

{ #category : #initialization }
TypInfNodeOrigin >> initializeNode: aNode [
	node := aNode
]

{ #category : #printing }
TypInfNodeOrigin >> printOn: aStream [
	node printOn: aStream
]
