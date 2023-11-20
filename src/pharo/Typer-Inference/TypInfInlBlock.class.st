Class {
	#name : #TypInfInlBlock,
	#superclass : #TypInfBlock,
	#traits : 'TypInfTFunction',
	#classTraits : 'TypInfTFunction classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlBlock >> inReturnType [
	^ (self in
		at: #return
		ifPresent: [ :s | (s collect: #origin) reject: #isDead thenCollect: #type ]
		ifAbsent: [ IdentitySet new ]) typAsMinimizedType
]

{ #category : #accessing }
TypInfInlBlock >> transfer [
	| return signal |
	return := self inReturnType.
	signal := self inSignalType.
	self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: return
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: (return isVoid ifTrue: [ signal ] ifFalse: [ nil ])
				signalsMaybe: (return isVoid ifTrue: [ nil ] ifFalse: [ signal ]))
				withNode: context block)
]
