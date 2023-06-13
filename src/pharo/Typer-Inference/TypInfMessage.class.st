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
	self
		outgoingAt: #inline
		ifPresent: [ :e | ^ false ]
		ifAbsent: [  ].
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
	| method |
	self assert: [ self canInline ].
	method := self receiver classDescription lookupSelector: node selector.
	method isAbstract
		ifTrue: [ method typInfOverriddingMethods do: [ :m | self inline: m ] ]
		ifFalse: [ self inline: method ]
]

{ #category : #transforming }
TypInfMessage >> inline: aMethod [
	TypInfMethodNodeStack
		push: aMethod ast
		max: 8
		during: [  "Halt once."| inline |
			inline := TypInfInlinedMethodContext
					sender: context
					state: state copy
					node: aMethod ast
					self: aMethod methodClass typAsType
					super: (aMethod methodClass superclass ifNotNil: #typAsType)
					message: self.
			inline visit.
			self flag: 'TODO use receiver,args as key, invalidate?'.
			self outgoingAt: #inline put: inline ]
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
