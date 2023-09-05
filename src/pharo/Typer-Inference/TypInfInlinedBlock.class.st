Class {
	#name : #TypInfInlinedBlock,
	#superclass : #TypInfBlock,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlinedBlock >> transfer [
	state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: (self inReturns collect: #type) typAsMinimizedType
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: nil) typInfWithNode: context block).
	self constrain: context block to: self type
]
