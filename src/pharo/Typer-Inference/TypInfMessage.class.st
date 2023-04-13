Class {
	#name : #TypInfMessage,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
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

	| receiver method context |
	receiver := state at: self incomingReceiver.
	(receiver isUnknown or: [ receiver isVariable ]) ifTrue: [ 
		| classes |
		classes := TypInfMethodIndex instance implementors: node selector.
		(classes size between: 1 and: 8) ifTrue: [ 
			state
				covariantFrom: self
				to: self incomingReceiver
				with: (classes collect: #typAsType) typAsType ] ].
	method := self method.
	method typInfNode ifNotNil: [ :n | 
		context := TypInfInlineContext
			           node: n node
			           receiver: receiver
			           arguments: self incomingArguments
			           state: state
			           message: self ].
	self incomingArguments withIndexDo: [ :e :i | 
		i <= method arguments size ifTrue: [ 
			state covariantFrom: self to: e with: (method arguments at: i) ] ].
	state covariant: self with: method result
]
