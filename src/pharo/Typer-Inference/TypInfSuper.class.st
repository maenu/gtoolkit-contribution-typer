Class {
	#name : #TypInfSuper,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfSuper >> transfer [
	state at: self put: context super
]
