Class {
	#name : #TypInfInference,
	#superclass : #Object,
	#instVars : [
		'type',
		'quality'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInference class >> type: aType quality: aNumber [
	^ self new
		initializeType: aType quality: aNumber;
		yourself
]

{ #category : #accessing }
TypInfInference >> initializeType: aType quality: aNumber [
	type := aType.
	quality := aNumber
]

{ #category : #accessing }
TypInfInference >> quality [
	^ quality
]

{ #category : #accessing }
TypInfInference >> quality: anObject [
	quality := anObject
]

{ #category : #accessing }
TypInfInference >> type [
	^ type
]

{ #category : #accessing }
TypInfInference >> type: anObject [
	type := anObject
]
