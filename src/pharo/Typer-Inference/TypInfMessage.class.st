Class {
	#name : #TypInfMessage,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMessage >> incomingReceiver [

	^ self incomingAt: #receiver
]

{ #category : #accessing }
TypInfMessage >> incomingReceiver: aNode [

	^ self incomingAt: #receiver put: aNode
]

{ #category : #accessing }
TypInfMessage >> method [

	^ (state at: self incomingReceiver)
		  lookupMethod: node selector asSymbol
		  arguments: (self incomingArguments collect: [ :e | state at: e ])
]

{ #category : #accessing }
TypInfMessage >> transfer [

	| type receiver method |
	type := state at: self.
	receiver := self incomingReceiver.
	(state at: receiver) isUnknown ifTrue: [ 
		| classes |
		classes := TypInfMethodIndex instance implementors: node selector.
		(classes size between: 1 and: 8) ifTrue: [ 
			self
				constrain: receiver
				to: (classes collect: #typAsType) typAsType
				in: state ] ].
	method := self method.
	self incomingArguments withIndexDo: [ :e :i | 
		i <= method arguments size ifTrue: [ 
			self constrain: e to: (method arguments at: i) in: state ] ].
	state at: self put: (type asNarrower: method result).
	TypInfSignal
		emitMessage: 'transfer'
		from: type
		to: (state at: self)
		node: self
]
