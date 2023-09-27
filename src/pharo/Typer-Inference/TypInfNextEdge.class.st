Class {
	#name : #TypInfNextEdge,
	#superclass : #TypInfEdge,
	#category : #'Typer-Inference-Core'
}

{ #category : #'instance creation' }
TypInfNextEdge class >> origin: aNode target: anotherNode [

	^ self origin: aNode target: anotherNode key: #next
]
