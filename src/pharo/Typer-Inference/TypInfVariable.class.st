Class {
	#name : #TypInfVariable,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfVariable >> constrainTo: aType [

	^ node variable typInfFlowConstrain: self to: aType
]

{ #category : #accessing }
TypInfVariable >> initialize: aState [

	state := aState.
	^ node variable typInfFlowInitialize: self in: state
]

{ #category : #'meta-object-protocol' }
TypInfVariable >> read [

	^ self incomingAt: #read ifPresent: #yourself ifAbsent: [ self ]
]

{ #category : #'meta-object-protocol' }
TypInfVariable >> read: aNode [

	^ self incomingAt: #read put: aNode
]

{ #category : #private }
TypInfVariable >> transfer [

	node variable typInfFlowTransfer: self in: state
]

{ #category : #accessing }
TypInfVariable >> type [

	^ self outgoingAt: #type ifAbsentPut: [ 
		  self incomingFlow
			  ifEmpty: [ 
				  outgoing
					  at: #read
					  ifPresent: [ :e | 
					  (e collect: [ :f | f target type ]) typAsType ]
					  ifAbsent: [ state at: self ] ]
			  ifNotEmpty: [ state at: self ] ]
]
