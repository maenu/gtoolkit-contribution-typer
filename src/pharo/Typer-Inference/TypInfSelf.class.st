Class {
	#name : #TypInfSelf,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfSelf >> initialize: aState [

	super initialize: aState.
	^ state at: self put: state self
]
