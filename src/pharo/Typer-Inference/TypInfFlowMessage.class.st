Class {
	#name : #TypInfFlowMessage,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowMessage >> method [

	<typEdge>
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
