Class {
	#name : #TypInfInlLookupMessage,
	#superclass : #TypInfMessage,
	#category : #'Typer-Inference-Inline'
}

{ #category : #accessing }
TypInfInlLookupMessage >> transfer [
	self flag: 'should respect alwaysSignals'.
	state
		at: self
		put: (context self
				lookupMethod: node selector asSymbol
				arguments: (self inArguments collect: [ :e | state at: e ])) result
]
