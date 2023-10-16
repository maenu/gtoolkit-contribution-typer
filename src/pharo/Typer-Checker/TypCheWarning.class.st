Class {
	#name : #TypCheWarning,
	#superclass : #Warning,
	#instVars : [
		'node'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheWarning class >> node: aNode message: aString [
	^ self new
		node: aNode;
		messageText: aString;
		yourself
]

{ #category : #accessing }
TypCheWarning >> node [
	^ node
]

{ #category : #accessing }
TypCheWarning >> node: anObject [
	node := anObject
]
