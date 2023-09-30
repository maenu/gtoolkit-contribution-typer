Class {
	#name : #TypCheWarning,
	#superclass : #Warning,
	#instVars : [
		'node'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheWarning class >> signal: aNode [
	^ self new
		node: aNode;
		signal
]

{ #category : #accessing }
TypCheWarning >> node [
	^ node
]

{ #category : #accessing }
TypCheWarning >> node: anObject [
	node := anObject
]
