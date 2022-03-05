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

{ #category : #accessing }
TypInfEdge >> at: aNode put: aType [

	changed := (state at: aNode) ~= aType.
	^ state at: aNode put: aType
]

{ #category : #testing }
TypInfEdge >> isChanged [

	^ changed
]

{ #category : #testing }
TypInfEdge >> isFlow [

	^ #( #next #execute #return #returnBlock #signal ) includes: key
]

{ #category : #accessing }
TypInfEdge >> log [

	^ log
]

{ #category : #accessing }
TypInfEdge >> state [

	^ state
]

{ #category : #accessing }
TypInfEdge >> state: anObject [

	state = anObject ifTrue: [ ^ changed := false ].
	log ifNil: [ log := LinkedList new ].
	log add: anObject.
	state := anObject.
	^ changed := true
]
