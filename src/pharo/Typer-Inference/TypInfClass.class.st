Class {
	#name : #TypInfClass,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfClass >> transfer [

	state
		covariant: self
		with: (node variable owningClass typAsType lookupVariable:
				 node variable name asSymbol)
]
