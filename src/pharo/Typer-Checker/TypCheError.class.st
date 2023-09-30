Class {
	#name : #TypCheError,
	#superclass : #Error,
	#instVars : [
		'node'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheError class >> signal: aNode [
	^ self new
		node: aNode;
		signal
]

{ #category : #accessing }
TypCheError >> node [
	^ node
]

{ #category : #accessing }
TypCheError >> node: anObject [
	node := anObject
]
