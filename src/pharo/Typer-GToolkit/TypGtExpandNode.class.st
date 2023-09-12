Class {
	#name : #TypGtExpandNode,
	#superclass : #BlEvent,
	#instVars : [
		'node'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtExpandNode class >> node: aNode [
	^ self new
		initializeNode: aNode;
		yourself
]

{ #category : #accessing }
TypGtExpandNode >> initializeNode: aNode [
	node := aNode
]

{ #category : #accessing }
TypGtExpandNode >> node [
	^ node
]
