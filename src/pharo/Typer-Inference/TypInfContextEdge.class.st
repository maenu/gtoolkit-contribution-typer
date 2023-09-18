Class {
	#name : #TypInfContextEdge,
	#superclass : #TypInfEdge,
	#instVars : [
		'context'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfContextEdge >> context [
	^ context
]

{ #category : #accessing }
TypInfContextEdge >> initializeOrigin: aNode target: anotherNode key: anObject [
	super
		initializeOrigin: aNode
		target: anotherNode
		key: anObject.
	context ifNil: [ context := origin context ]
]
