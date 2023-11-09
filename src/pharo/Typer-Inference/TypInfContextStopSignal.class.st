Class {
	#name : #TypInfContextStopSignal,
	#superclass : #TypInfNodeSignal,
	#instVars : [
		'start',
		'tally'
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
TypInfContextStopSignal class >> node: aNode start: aSignal tally: aTally [
	^ (super node: aNode)
		initializeStart: aSignal tally: aTally;
		yourself
]

{ #category : #accessing }
TypInfContextStopSignal >> duration [
	^ timestamp - start timestamp
]

{ #category : #accessing }
TypInfContextStopSignal >> initializeStart: aSignal tally: aTally [
	start := aSignal.
	tally := aTally
]

{ #category : #accessing }
TypInfContextStopSignal >> printOneLineContentsOn: aStream [
	self duration printOn: aStream.
	aStream nextPut: Character space.
	super printOneLineContentsOn: aStream
]
