Class {
	#name : #TypInfWorkspace,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfWorkspace >> transfer [
	state at: self put: node variable value typInfType
]
