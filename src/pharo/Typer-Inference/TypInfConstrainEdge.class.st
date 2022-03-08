Class {
	#name : #TypInfConstrainEdge,
	#superclass : #TypInfEdge,
	#category : #'Typer-Inference-Core'
}

{ #category : #generated }
TypInfConstrainEdge >> type [

	^ state at: target
]

{ #category : #generated }
TypInfConstrainEdge >> type: aType [

	state at: target put: aType
]
