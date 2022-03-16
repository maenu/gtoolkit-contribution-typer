Class {
	#name : #TypInfArray,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfArray >> initialize: aState [

	state := aState.
	^ state at: self put: Array typAsType
]

{ #category : #'as yet unclassified' }
TypInfArray >> transfer [

	state at: self put: (Array typAsType withParameters:
			 { (self incomingArguments collect: [ :e | state at: e ]) typAsType }).
	super transfer
]