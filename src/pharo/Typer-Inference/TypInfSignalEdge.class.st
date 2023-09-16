Class {
	#name : #TypInfSignalEdge,
	#superclass : #TypInfEdge,
	#instVars : [
		'exception'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSignalEdge class >> origin: aNode target: anotherNode [
	^ self
		origin: aNode
		target: anotherNode
		key: #signal
]

{ #category : #accessing }
TypInfSignalEdge >> exception [
	^ exception
]

{ #category : #accessing }
TypInfSignalEdge >> exception: anException [
	exception := anException
]
