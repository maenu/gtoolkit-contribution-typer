Class {
	#name : #TypInfSignalContext,
	#superclass : #TypInfInlContext,
	#instVars : [
		'exception',
		'edge'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSignalContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessage [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfSignalContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessage exception: anException [
	^ (super
		sender: aContext
		state: aState
		node: aNode
		self: aType
		super: anotherType
		message: aMessage)
		initializeException: anException;
		yourself
]

{ #category : #accessing }
TypInfSignalContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ exception = anObject exception
]

{ #category : #accessing }
TypInfSignalContext >> exception [
	^ exception
]

{ #category : #accessing }
TypInfSignalContext >> hash [
	^ super hash bitXor: exception hash
]

{ #category : #accessing }
TypInfSignalContext >> initializeException: anException [
	self assert: [ anException isKindOf: TypType ].
	exception := anException
]

{ #category : #accessing }
TypInfSignalContext >> install [
	self assert: [ root isNil ].
	self assert: [ current isNil ].
	sender children add: self.
	current := root := self add: (TypInfSignalMessage node: node context: self).
	edge := message outAdd: (TypInfNextEdge origin: message target: root).
	root
		inReceiver: message inReceiver;
		inArguments: message inArguments.
	self stack
		reverseDo: [ :c | 
			root
				outAdd: ((TypInfSignalEdge origin: root target: c root)
						exception: exception;
						yourself).
			(c handles: exception) ifTrue: [ ^ self ] ]
]

{ #category : #accessing }
TypInfSignalContext >> stackSize [
	^ sender stackSize
]

{ #category : #accessing }
TypInfSignalContext >> uninstall [
	edge remove.
	super uninstall
]
