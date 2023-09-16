Class {
	#name : #TypInfSignalContext,
	#superclass : #TypInfInlContext,
	#instVars : [
		'exception'
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
		exception: anException;
		yourself
]

{ #category : #accessing }
TypInfSignalContext >> canInstall [
	^ message receiver hasClassDescription
]

{ #category : #accessing }
TypInfSignalContext >> exception: anException [
	self assert: [ (anException isKindOf: TypType) not ].
	exception := anException
]

{ #category : #accessing }
TypInfSignalContext >> newRoot [
	^ TypInfSignalMessage
		node: node
		context: self
		exception: exception
]

{ #category : #accessing }
TypInfSignalContext >> stackSize [
	^ sender stackSize
]

{ #category : #accessing }
TypInfSignalContext >> visitNode [
	message outAdd: (TypInfNextEdge origin: message target: root).
	root
		inReceiver: message inReceiver;
		inArguments: message inArguments.
	exception := (TypInfIndex instance
			anonymousClass: message receiver classDescription) typInfNew.
	(self newExceptionHandlerContextOrNil: exception)
		ifNil: [ root
				outAdd: ((TypInfSignalEdge origin: root target: self home root)
						exception: exception;
						yourself) ]
		ifNotNil: [ root
				outAdd: (TypInfEdge
						origin: root
						target: (message outAt: #nextOriginal)
						key: #nextOriginal) ]
]
