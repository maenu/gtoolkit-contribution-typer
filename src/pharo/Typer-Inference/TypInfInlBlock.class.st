Class {
	#name : #TypInfInlBlock,
	#superclass : #TypInfBlock,
	#category : #'Typer-Inference-Inline'
}

{ #category : #accessing }
TypInfInlBlock >> transfer [
	state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: self inReturnType
				arguments: (self inArguments collect: #type)) typInfWithNode: context block).
	self constrain: context block to: self type
]
