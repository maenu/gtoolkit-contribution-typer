Class {
	#name : #TypInfArray,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfArray >> transfer [
	self
		put: (Array typAsType
				withParameters: {self inArguments
							ifEmpty: [ TypUnknownType instance ]
							ifNotEmpty: [ :s | (s collect: [ :e | state at: e ]) typAsType ]})
]
