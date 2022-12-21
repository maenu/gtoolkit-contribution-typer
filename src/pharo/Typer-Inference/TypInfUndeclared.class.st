Class {
	#name : #TypInfUndeclared,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfUndeclared >> initialize: aState [

	super initialize: aState.
	^ state at: self put: TypUnknownType instance
]
