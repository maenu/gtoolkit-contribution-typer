Class {
	#name : #TypInfWorkspace,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfWorkspace >> transfer [
	self put: node variable value typInfType
]
