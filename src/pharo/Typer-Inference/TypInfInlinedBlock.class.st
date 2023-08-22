Class {
	#name : #TypInfInlinedBlock,
	#superclass : #TypInfBlock,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlinedBlock >> transfer [
	state
		at: self
		covariantPut: ((BlockClosure
				typAsFunctionTypeWithResult: (self inReturns collect: #type) typAsType
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: nil)
				typInfNode: context block;
				yourself).
	self constrain: context block to: self type
]
