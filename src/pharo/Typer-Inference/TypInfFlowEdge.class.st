Class {
	#name : #TypInfFlowEdge,
	#superclass : #TypEdge,
	#instVars : [
		'state'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowEdge >> state [

	^ state
]

{ #category : #accessing }
TypInfFlowEdge >> state: anObject [

	state := anObject
]
