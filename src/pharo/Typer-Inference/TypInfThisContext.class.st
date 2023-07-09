Class {
	#name : #TypInfThisContext,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfThisContext >> initialize: aState [
	super initialize: aState.
	state at: self put: Context typAsType
]
