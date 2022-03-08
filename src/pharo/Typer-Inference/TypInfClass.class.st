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
	type := node owningClass typAsType lookupVariable: node name asSymbol.
	state at: self put: type
]
