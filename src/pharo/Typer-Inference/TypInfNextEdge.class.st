Class {
	#name : #TypInfNextEdge,
	#superclass : #TypInfContextEdge,
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
	^ state isNotNil
]

{ #category : #accessing }
TypInfNextEdge >> slurp [
	^ [ state ] ensure: [ state := nil ]
]

{ #category : #accessing }
TypInfNextEdge >> state [
	^ state
]

{ #category : #accessing }
TypInfNextEdge >> state: anObject [
	state := anObject
]
