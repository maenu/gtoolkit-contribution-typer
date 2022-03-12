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

	^ #( #next #execute #return #returnBlock ) includes: key
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
	"log ifNil: [ log := LinkedList new ].
	log add: anObject."
	state := anObject.
	^ changed := true
]

{ #category : #generated }
TypInfEdge >> type [

	^ state at: target
]

{ #category : #generated }
TypInfEdge >> type: aType [

	state at: target put: aType
]
