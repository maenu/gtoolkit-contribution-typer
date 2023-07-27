Class {
	#name : #TypInfGlobal,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfGlobal >> initialize: aState [
	super initialize: aState.
	state at: self put: node variable value typInfType
]

{ #category : #initialization }
TypInfGlobal >> transfer [
	state at: self put: node variable value typInfType
]
