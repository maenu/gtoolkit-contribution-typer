Class {
	#name : #TypInfMessage,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

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
		classes := TypInfImplementorsCache instance implementors:
			           node selector.
		(classes size between: 1 and: 8) ifTrue: [ 
			receiver
				constrainTo: (classes collect: #typAsType) typAsType
				in: state ] ].
	method := self methodIn: state.
	self arguments withIndexDo: [ :e :i | 
		e
			constrainTo:
			(method arguments at: i ifAbsent: [ TypUnknownType instance ])
			in: state ].
	state at: self put: method result
]
