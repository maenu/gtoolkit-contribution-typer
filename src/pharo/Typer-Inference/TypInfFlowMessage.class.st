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
TypInfFlowMessage >> methodIn: aState [

	^ (aState at: self receiver)
		  lookupMethod: node selector asSymbol
		  arguments: (self arguments collect: [ :e | aState at: e ])
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
TypInfFlowMessage >> transfer [

	state at: self put: (self methodIn: state) result
]
