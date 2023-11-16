Class {
	#name : #TypInfGlobal,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfGlobal >> transfer [
	self put: node variable value typInfType
]
