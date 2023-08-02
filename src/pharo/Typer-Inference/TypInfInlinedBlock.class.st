Class {
	#name : #TypInfInlinedBlock,
	#superclass : #TypInfInlinedMethod,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlinedBlock >> transfer [
	state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: (self inReturns collect: #type) typAsType
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: nil)
				outAt: #method ifAbsentPut: [ self ];
				yourself)
]
