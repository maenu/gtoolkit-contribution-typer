Class {
	#name : #TypInfContextStopSignal,
	#superclass : #TypInfNodeSignal,
	#instVars : [
		'start'
	],
	#category : #'Typer-Inference-Signals'
}

{ #category : #accessing }
TypInfContextStopSignal class >> emit: aNode [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfContextStopSignal class >> node: aNode [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfContextStopSignal class >> node: aNode start: aSignal [
	^ (super node: aNode)
		initializeStart: aSignal;
		yourself
]

{ #category : #accessing }
TypInfContextStopSignal >> duration [
	^ timestamp - start timestamp
]

{ #category : #accessing }
TypInfContextStopSignal >> initializeStart: aSignal [
	start := aSignal
]

{ #category : #accessing }
TypInfContextStopSignal >> printOneLineContentsOn: aStream [
	self duration printOn: aStream.
	aStream nextPut: Character space.
	super printOneLineContentsOn: aStream
]
