Class {
	#name : #TypNodeOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'node'
	],
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypNodeOrigin class >> node: aNode [
	^ self new
		initializeNode: aNode;
		yourself
]

{ #category : #accessing }
TypNodeOrigin >> initializeNode: aNode [
	node := aNode
]

{ #category : #accessing }
TypNodeOrigin >> node [
	^ node
]
