Class {
	#name : #TypInfReturnEdge,
	#superclass : #TypInfContextEdge,
	#category : #'Typer-Inference-Core'
}

{ #category : #'instance creation' }
TypInfReturnEdge class >> origin: aNode target: anotherNode [
	^ self
		origin: aNode
		target: anotherNode
		key: #return
]

{ #category : #accessing }
TypInfReturnEdge >> type [
	^ origin type
]
