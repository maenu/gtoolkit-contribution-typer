Class {
	#name : #TypInfVariable,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfVariable >> covariantPut: aType [
	state at: node variable covariantPut: aType.
	state at: self covariantPut: aType
]

{ #category : #accessing }
TypInfVariable >> put: aType [
	state at: node variable put: aType.
	state at: self put: aType
]
