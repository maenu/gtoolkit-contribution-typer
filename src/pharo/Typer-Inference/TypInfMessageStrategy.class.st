Class {
	#name : #TypInfMessageStrategy,
	#superclass : #Object,
	#instVars : [
		'message'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMessageStrategy class >> message: aMessage [
	^ self new
		initializeMessage: aMessage;
		yourself
]

{ #category : #accessing }
TypInfMessageStrategy >> apply [
	self subclassResponsibility
]

{ #category : #accessing }
TypInfMessageStrategy >> canApply [
	self subclassResponsibility
]

{ #category : #accessing }
TypInfMessageStrategy >> initializeMessage: aMessage [
	message := aMessage
]

{ #category : #accessing }
TypInfMessageStrategy >> revert [
	self subclassResponsibility
]
