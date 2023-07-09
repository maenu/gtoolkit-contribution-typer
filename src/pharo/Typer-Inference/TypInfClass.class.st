Class {
	#name : #TypInfClass,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfClass >> transfer [
	state
		at: self
		put: (node variable owningClass typAsType lookupVariable: node variable name asSymbol)
]
