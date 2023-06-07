Class {
	#name : #TypInfMessage,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMessage >> canInline [
	| receiver |
	self flag: 'TODO check if already inlined'.
	receiver := self receiver.
	receiver isNamed ifFalse: [ ^ false ].
	receiver hasClassDescription ifFalse: [ ^ false ].
	^ receiver classDescription canUnderstand: node selector
]

{ #category : #accessing }
TypInfMessage >> incomingReceiver [

	^ self incomingAt: #receiver
]

{ #category : #accessing }
TypInfMessage >> incomingReceiver: aNode [

	^ self incomingAt: #receiver put: aNode
]

{ #category : #accessing }
TypInfMessage >> inline [
	| receiver method |
	self assert: [ self canInline ].
	receiver := self receiver.
	method := receiver classDescription lookupSelector: node selector.
	TypInfMethodNodeStack
		push: method ast
		max: 8
		during: [ (TypInfInlinedMethodContext
				sender: context
				state: state copy
				node: method ast
				self: receiver
				super: (method methodClass superclass ifNotNil: #typAsType)
				message: self) visit ]
		or: [  "Halt once" ]
]

{ #category : #accessing }
TypInfMessage >> receiver [
	^ state at: self incomingReceiver
]

{ #category : #accessing }
TypInfMessage >> transfer [
	| receiver method |
	receiver := self receiver.
	self
		flag: '(receiver isUnknown or: [ receiver isVariable ]) ifTrue: [ 
		| classes |
		classes := TypInfMethodIndex instance implementors: node selector.
		(classes size between: 1 and: 8) ifTrue: [ 
			state
				covariantFrom: self
				to: self incomingReceiver
				with: (classes collect: #typAsType) typAsType ] ]'.
	method := receiver
			lookupMethod: node selector asSymbol
			arguments: (self incomingArguments collect: [ :e | state at: e ]).
	self incomingArguments
		withIndexDo: [ :e :i | 
			i <= method arguments size
				ifTrue: [ state
						covariantFrom: self
						to: e
						with: (method arguments at: i) ] ].
	state covariant: self with: method result.
	self canInline ifTrue: [ self inline ]
]
