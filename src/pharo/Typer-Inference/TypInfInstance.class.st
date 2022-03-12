Class {
	#name : #TypInfInstance,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfInstance >> transfer [

	(state at: self) isUnknown ifFalse: [ ^ self ].
	state
		at: self
		put: (node variable owningClass typAsType lookupVariable:
				 node variable name asSymbol)
]
