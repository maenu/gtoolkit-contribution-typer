Class {
	#name : #TypInfThisContext,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfThisContext >> transfer [
	self put: Context typAsType
]
