Class {
	#name : #TypInfFlowArray,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
	#category : #'Typer-Inference-Flow'
}

{ #category : #'as yet unclassified' }
TypInfFlowArray >> slurp [

	^ Array typAsType withParameters:
		  { (self arguments collect: #type) typAsType }
]
