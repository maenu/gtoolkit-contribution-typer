Class {
	#name : #TypInfEdge,
	#superclass : #TypEdge,
	#category : #'Typer-Inference-Core'
}

{ #category : #testing }
TypInfEdge >> isReturn [

	^ false
]

{ #category : #testing }
TypInfEdge >> isTighten [

	^ false
]
