Class {
	#name : #TypInfInlBlock,
	#superclass : #TypInfBlock,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlBlock >> transfer [
	state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: self inReturnType
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: self signalsAlways) withNode: context block).
	self constrain: context block to: self type
]
