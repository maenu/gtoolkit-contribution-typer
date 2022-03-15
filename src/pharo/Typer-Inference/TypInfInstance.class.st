Class {
	#name : #TypInfInstance,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfInstance >> transfer [

	| type |
	type := state at: self.
	type isUnknown ifFalse: [ ^ self ].
	state
		at: self
		put: (node variable owningClass typAsType lookupVariable:
				 node variable name asSymbol).
	TypInfSignal
		emitMessage: 'transfer'
		from: type
		to: (state at: self)
		node: self
]
