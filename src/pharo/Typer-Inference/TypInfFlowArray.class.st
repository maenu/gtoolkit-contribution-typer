Class {
	#name : #TypInfFlowArray,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowArray >> initialize: aState [

	aState at: self put: Array typAsType
]

{ #category : #'as yet unclassified' }
TypInfFlowArray >> transfer [

	state at: self put: (Array typAsType withParameters:
			 { (self arguments collect: [ :e | state at: e ]) typAsType })
]
