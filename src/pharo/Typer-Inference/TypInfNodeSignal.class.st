Class {
	#name : #TypInfNodeSignal,
	#superclass : #BeaconSignal,
	#instVars : [
		'node'
	],
	#category : #'Typer-Inference-Signals'
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

{ #category : #accessing }
TypInfNodeSignal >> node [
	^ node
]

{ #category : #accessing }
TypInfNodeSignal >> printOneLineContentsOn: aStream [
	node printOn: aStream.
	super printOneLineContentsOn: aStream
]
