Class {
	#name : #TypInfClass,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfClass >> transfer [

	| type |
	type := state at: self.
	type isUnknown ifFalse: [ ^ self ].
	type := node variable owningClass typAsType lookupVariable: node variable name asSymbol.
	state at: self put: type
]
