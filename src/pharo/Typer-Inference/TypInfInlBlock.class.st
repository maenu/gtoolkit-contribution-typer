Class {
	#name : #TypInfInlBlock,
	#superclass : #TypInfBlock,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlBlock >> transfer [
	| return signal |
	return := self inReturnType.
	signal := self inSignalType.
	state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: return
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: (return isVoid ifTrue: [ signal ] ifFalse: [ nil ])
				signalsMaybe: (return isVoid ifTrue: [ nil ] ifFalse: [ signal ]))
				withNode: context block).
	self constrain: context block to: self type
]
