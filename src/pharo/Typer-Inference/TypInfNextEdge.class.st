Class {
	#name : #TypInfNextEdge,
	#superclass : #TypInfEdge,
	#instVars : [
		'state'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'instance creation' }
TypInfNextEdge class >> origin: aNode target: anotherNode [

	^ self origin: aNode target: anotherNode key: #next
]

{ #category : #accessing }
TypInfNextEdge >> canBeSlurped [
	^ self state index includesKey: origin
]

{ #category : #accessing }
TypInfNextEdge >> state [
	^ state ifNil: [ state := origin state ]
]

{ #category : #accessing }
TypInfNextEdge >> state: anObject [
	state := anObject
]
