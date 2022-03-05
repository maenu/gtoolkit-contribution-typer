Class {
	#name : #TypInfMessage,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMessage >> method [

	^ self methodIn: state
]

{ #category : #accessing }
TypInfMessage >> methodIn: aState [

	^ (aState at: self receiver)
		  lookupMethod: node selector asSymbol
		  arguments: (self arguments collect: [ :e | aState at: e ])
]

{ #category : #accessing }
TypInfMessage >> receiver [

	^ self incomingAt: #receiver
]

{ #category : #accessing }
TypInfMessage >> receiver: aNode [

	^ self incomingAt: #receiver put: aNode
]

{ #category : #accessing }
TypInfMessage >> transfer [

	| receiver method |
	receiver := self receiver.
	(state at: receiver) isUnknown ifTrue: [ 
		| classes |
		classes := TypInfMethodIndex instance implementors: node selector.
		(classes size between: 1 and: 8) ifTrue: [ 
			self
				constrain: receiver
				to: (classes collect: #typAsType) typAsType ] ].
	method := self methodIn: state.
	self arguments withIndexDo: [ :e :i | 
		i <= method arguments size ifTrue: [ 
			self constrain: e to: (method arguments at: i) ] ].
	state at: self put: method result
]
