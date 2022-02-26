Class {
	#name : #TypInfFlowEdge,
	#superclass : #TypEdge,
	#instVars : [
		'state',
		'changed',
		'log'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #testing }
TypInfFlowEdge >> isChanged [

	^ changed
]

{ #category : #testing }
TypInfFlowEdge >> isFlow [

	^ #( #next #execute #return #signal ) includes: data
]

{ #category : #accessing }
TypInfFlowEdge >> state [

	^ state
]

{ #category : #accessing }
TypInfFlowEdge >> state: anObject [

	changed := state ~= anObject.
	changed ifTrue: [ 
		log ifNil: [ log := LinkedList new ].
		state
			ifNil: [ log add: anObject ]
			ifNotNil: [ log add: (state diff: anObject) ] ].
	state := anObject.
	^ changed
]
