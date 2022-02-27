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

	^ #( #next #execute #return #signal ) includes: data
]

{ #category : #accessing }
TypInfEdge >> state [

	^ state
]

{ #category : #accessing }
TypInfEdge >> state: anObject [

	changed := state ~= anObject.
	"changed ifTrue: [ 
		log ifNil: [ log := LinkedList new ].
		state
			ifNil: [ log add: anObject ]
			ifNotNil: [ log add: (state diff: anObject) ] ]."
	state := anObject.
	^ changed
]
