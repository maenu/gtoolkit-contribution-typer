Class {
	#name : #TypLookupNodeOrigin,
	#superclass : #TypLookupOrigin,
	#instVars : [
		'node'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupNodeOrigin class >> node: aNode [
	^ self new
		initializeNode: aNode;
		yourself
]

{ #category : #accessing }
TypLookupNodeOrigin >> initializeNode: aNode [
	node := aNode
]

{ #category : #accessing }
TypLookupNodeOrigin >> isNode [
	^ true
]

{ #category : #accessing }
TypLookupNodeOrigin >> node [
	^ node
]
