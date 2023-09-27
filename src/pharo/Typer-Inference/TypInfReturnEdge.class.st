Class {
	#name : #TypInfReturnEdge,
	#superclass : #TypInfEdge,
	#category : #'Typer-Inference-Core'
}

{ #category : #'instance creation' }
TypInfReturnEdge class >> origin: aNode target: anotherNode [
	^ self
		origin: aNode
		target: anotherNode
		key: #return
]
