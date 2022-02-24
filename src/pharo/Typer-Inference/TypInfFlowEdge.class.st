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

{ #category : #initialization }
TypInfFlowEdge >> initialize [

	super initialize.
	log := OrderedCollection new
]

{ #category : #testing }
TypInfFlowEdge >> isChanged [

	^ changed
]

{ #category : #testing }
TypInfFlowEdge >> isFlow [

	^ #( #next #execute #return #signal ) includes: data
]

{ #category : #accessing }
TypInfFlowEdge >> log [

	^ log
]

{ #category : #accessing }
TypInfFlowEdge >> state [

	^ state
]

{ #category : #accessing }
TypInfFlowEdge >> state: anObject [

	changed := state ~= anObject.
	changed ifTrue: [ log add: anObject ].
	state := anObject.
	^ changed
]
