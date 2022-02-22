Class {
	#name : #TypInfFlowMethod,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
	#category : #'Typer-Inference-Flow'
}

{ #category : #execution }
TypInfFlowMethod >> execute [

	^ self outgoingAt: #execute
]

{ #category : #execution }
TypInfFlowMethod >> execute: aNode [

	^ self outgoingAt: #execute put: aNode
]

{ #category : #accessing }
TypInfFlowMethod >> lookup [

	^ self self type
		  lookupMethod: node selector asSymbol
		  arguments: (self arguments collect: #type)
]
