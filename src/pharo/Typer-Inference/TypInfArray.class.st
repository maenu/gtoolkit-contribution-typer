Class {
	#name : #TypInfArray,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfArray >> transfer [

	state at: self put: (Array typAsType withParameters:
			 { (self inArguments collect: [ :e | state at: e ]) typAsType })
]
