Class {
	#name : #TypInfInlinedLookupMessage,
	#superclass : #TypInfMessage,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlinedLookupMessage >> initialize [
	super initialize.
	strategies := {TypInfLookupMessageStrategy message: self}.
	currentStrategy := strategies last
]

{ #category : #accessing }
TypInfInlinedLookupMessage >> transfer [
	state
		at: self
		put: (context self
				lookupMethod: node selector asSymbol
				arguments: (self inArguments collect: [ :e | state at: e ])) result
]
