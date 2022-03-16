Class {
	#name : #TypInfInstance,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfInstance >> transfer [

	state at: self put: ((state at: self) tighten:
			 (node variable owningClass typAsType lookupVariable:
				  node variable name asSymbol)).
	super transfer
]
