Class {
	#name : #TypInfRecursiveMessage,
	#superclass : #TypInfMessage,
	#instVars : [
		'message'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfRecursiveMessage >> message [
	^ message
]

{ #category : #accessing }
TypInfRecursiveMessage >> message: anObject [
	message := anObject
]

{ #category : #accessing }
TypInfRecursiveMessage >> newContexts [
	^ #()
]

{ #category : #accessing }
TypInfRecursiveMessage >> transfer [
	state at: self put: (state at: message)
]
