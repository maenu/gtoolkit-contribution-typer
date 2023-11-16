Class {
	#name : #TypCheWarning,
	#superclass : #Warning,
	#instVars : [
		'node',
		'lookup'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheWarning >> lookup [
	^ lookup
]

{ #category : #accessing }
TypCheWarning >> lookup: anObject [
	lookup := anObject
]

{ #category : #accessing }
TypCheWarning >> node [
	^ node
]

{ #category : #accessing }
TypCheWarning >> node: anObject [
	node := anObject
]
