Class {
	#name : #TypInfEdge,
	#superclass : #TypEdge,
	#instVars : [
		'state',
		'changed',
		'log'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #testing }
TypInfEdge >> isChanged [

	^ changed
]

{ #category : #testing }
TypInfEdge >> isFlow [

	^ #( #next #execute #return #returnBlock #signal ) includes: key
]

{ #category : #accessing }
TypInfEdge >> state [

	^ state
]

{ #category : #accessing }
TypInfEdge >> state: anObject [

	state == anObject ifTrue: [ ^ changed := false ].
	"changed ifTrue: [ 
		log ifNil: [ log := LinkedList new ].
		state
			ifNil: [ log add: anObject ]
			ifNotNil: [ log add: (state diff: anObject) ] ]."
	state := anObject.
	^ changed := true
]
