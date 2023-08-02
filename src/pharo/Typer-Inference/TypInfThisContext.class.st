Class {
	#name : #TypInfThisContext,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfThisContext >> transfer [
	state at: self put: Context typAsType
]
