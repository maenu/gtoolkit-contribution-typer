Class {
	#name : #TypInfMessage,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMessage >> abstractInterpret [
	^ self receiver typInfAbstractInterpret: self
]

{ #category : #accessing }
TypInfMessage >> canAbstractInterpret [
	^ self
		outAt: #abstractInterpret
		ifPresent: [ :e | false ]
		ifAbsent: [ true ]
]

{ #category : #accessing }
TypInfMessage >> canInline [
	| receiver |
	self flag: 'TODO check if already inlined'.
	self
		outAt: #inline
		ifPresent: [ :e | ^ false ]
		ifAbsent: [  ].
	receiver := self receiver.
	receiver isNamed ifFalse: [ ^ false ].
	receiver hasClassDescription ifFalse: [ ^ false ].
	^ receiver classDescription canUnderstand: node selector
]

{ #category : #accessing }
TypInfMessage >> inReceiver [

	^ self inAt: #receiver
]

{ #category : #accessing }
TypInfMessage >> inReceiver: aNode [

	^ self inAt: #receiver put: aNode
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
			inline := TypInfInlineContext
					sender: context
					state: state copy
					node: aMethod ast
					self: aMethod methodClass typAsType
					super: (aMethod methodClass superclass ifNotNil: #typAsType)
					message: self.
			inline visit.
			self flag: 'TODO use receiver,args as key, invalidate?'.
			self outAt: #inline put: inline ]
		or: [  "Halt once" ]
]

{ #category : #accessing }
TypInfMessage >> receiver [
	^ state at: self inReceiver
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
				to: self inReceiver
				with: (classes collect: #typAsType) typAsType ] ]'.
	method := receiver
			lookupMethod: node selector asSymbol
			arguments: (self inArguments collect: [ :e | state at: e ]).
	self inArguments
		withIndexDo: [ :e :i | i <= method arguments size ifTrue: [ state at: e put: (method arguments at: i) ] ].
	state at: self put: method result.
	self
		outAt: #abstractInterpret
		ifPresent: [ :e | ^ self ]
		ifAbsent: [  "noop" ].
	self canAbstractInterpret ifTrue: [ self abstractInterpret ifTrue: [ ^ self ] ].
	self
		outAt: #inline
		ifPresent: [ :e | ^ self ]
		ifAbsent: [  "noop" ].
	self canInline ifTrue: [ self inline ]
]
