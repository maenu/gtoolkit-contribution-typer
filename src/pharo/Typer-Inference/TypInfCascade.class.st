Class {
	#name : #TypInfCascade,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfCascade >> transfer [
	self put: self previous
]
