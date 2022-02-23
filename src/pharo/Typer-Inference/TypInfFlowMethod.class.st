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
TypInfFlowMethod >> initialize: aState [

	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments:
		  (node arguments collect: [ :e | TypUnknownType instance ])
		  argumentsOptional: false
		  signalsAlways: nil
]

{ #category : #accessing }
TypInfFlowMethod >> methodIn: aState [

	^ aState self
		  lookupMethod: node selector asSymbol
		  arguments: (self arguments collect: [ :e | aState at: e ])
]

{ #category : #accessing }
TypInfFlowMethod >> transfer: aState [

	aState at: self put: (self methodIn: aState)
]
