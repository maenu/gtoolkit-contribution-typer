Class {
	#name : #TypInfSuper,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfSuper >> initialize: aState [

	super initialize: aState.
	^ state at: self put: state super
]
