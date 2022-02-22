Class {
	#name : #TypInfFlowVariable,
	#superclass : #TypInfFlowNode,
	#category : #'Typer-Inference-Flow'
}

{ #category : #'meta-object-protocol' }
TypInfFlowVariable >> read [

	^ self incomingAt: #read
]

{ #category : #'meta-object-protocol' }
TypInfFlowVariable >> read: aNode [

	^ self incomingAt: #read put: aNode
]

{ #category : #private }
TypInfFlowVariable >> slurp [

	^ node owningClass typAsType lookupVariable: node name asSymbol
]

{ #category : #private }
TypInfFlowVariable >> type [

	^ self
		  incomingAt: #read
		  ifPresent: [ :e | e node variable typInfFlowTypeIn: self ]
		  ifAbsent: [ node variable typInfFlowTypeIn: self ]
]
