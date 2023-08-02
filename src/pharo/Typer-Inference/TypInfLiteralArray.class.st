Class {
	#name : #TypInfLiteralArray,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLiteralArray >> transfer [
	state
		at: self
		put: (node isForByteArray
				ifTrue: [ ByteArray typAsType ]
				ifFalse: [ Array typAsType withParameters: {(self inArguments collect: #type) typAsType} ])
]
