Class {
	#name : #TypInfInstance,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInstance >> initialize: aState [

	super initialize: aState.
	^ state
		  at: self
		  put: (node variable owningClass typAsType lookupVariable:
				   node variable name asSymbol)
]
