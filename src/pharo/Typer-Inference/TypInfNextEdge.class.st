Class {
	#name : #TypInfNextEdge,
	#superclass : #TypInfEdge,
	#instVars : [
		'state',
		'log'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'instance creation' }
TypInfNextEdge class >> origin: aNode target: anotherNode [

	^ self origin: aNode target: anotherNode key: #next
]

{ #category : #accessing }
TypInfNextEdge >> state [

	^ state
]

{ #category : #accessing }
TypInfNextEdge >> state: anObject [

	state = anObject ifTrue: [ ^ false ].
	"log ifNil: [ log := LinkedList new ].
	log add: anObject."
	state := anObject.
	^ true
]
