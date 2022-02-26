Class {
	#name : #TypInfFlowMessage,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
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

	| receiver method |
	receiver := self receiver.
	(state at: receiver) isUnknown ifTrue: [ 
		| classes |
		classes := TypInfImplementorsCache instance implementors:
			           node selector.
		(classes size between: 1 and: 8) ifTrue: [ 
			receiver
				constrainTo: (classes collect: #typAsType) typAsType
				in: state ] ].
	method := self methodIn: state.
	self arguments withIndexDo: [ :e :i | 
		e constrainTo: (method arguments at: i) in: state ].
	state at: self put: method result
]
