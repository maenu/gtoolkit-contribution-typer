Class {
	#name : #TypInfFlowSequence,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowSequence >> type [

	^ TypNilType instance
]
