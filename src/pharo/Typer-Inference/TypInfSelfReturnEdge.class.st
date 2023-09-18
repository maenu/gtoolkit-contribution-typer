Class {
	#name : #TypInfSelfReturnEdge,
	#superclass : #TypInfReturnEdge,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSelfReturnEdge >> type [
	^ context self
]
