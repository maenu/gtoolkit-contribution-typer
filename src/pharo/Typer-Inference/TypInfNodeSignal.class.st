Class {
	#name : #TypInfNodeSignal,
	#superclass : #BeaconSignal,
	#instVars : [
		'node'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfNodeSignal class >> emit: aNode [
	^ (self node: aNode) emit
]

{ #category : #accessing }
TypInfNodeSignal class >> node: aNode [
	^ self new
		initializeNode: aNode;
		yourself
]

{ #category : #accessing }
TypInfNodeSignal >> initializeNode: aNode [
	node := aNode
]
