Class {
	#name : #TypInfFlowEdge,
	#superclass : #TypEdge,
	#instVars : [
		'state',
		'changed'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #initialization }
TypInfFlowEdge >> initialize [

	super initialize.
	changed := true
]

{ #category : #testing }
TypInfFlowEdge >> isChanged [

	^ changed
]

{ #category : #testing }
TypInfFlowEdge >> isFlow [

	^ #( #next #execute #return #returnSelf #signal ) includes: data
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
