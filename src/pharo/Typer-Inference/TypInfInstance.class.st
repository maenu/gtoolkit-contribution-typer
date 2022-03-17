Class {
	#name : #TypInfInstance,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfInstance >> transfer [

	state
		tighten: self
		with: (node variable owningClass typAsType lookupVariable:
				 node variable name asSymbol)
]
