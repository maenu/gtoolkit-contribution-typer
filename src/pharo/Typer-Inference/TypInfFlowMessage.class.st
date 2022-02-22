Class {
	#name : #TypInfFlowMessage,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
	#instVars : [
		'method'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowMessage >> lookup [

	^ self receiver type
		  lookupMethod: node selector asSymbol
		  arguments: (self arguments collect: #type)
]

{ #category : #accessing }
TypInfFlowMessage >> receiver [

	^ self incomingAt: #receiver
]

{ #category : #accessing }
TypInfFlowMessage >> receiver: aNode [

	^ self incomingAt: #receiver put: aNode
]

{ #category : #accessing }
TypInfFlowMessage >> result [

	^ self lookup result
]
