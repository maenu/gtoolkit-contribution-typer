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
	state := anObject.
	^ changed
]
