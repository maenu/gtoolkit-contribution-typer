Class {
	#name : #TypInfInlinedMethod,
	#superclass : #TypInfMethod,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlinedMethod >> transfer [

	state at: self put: (self inReturns collect: #type) typAsType
]
