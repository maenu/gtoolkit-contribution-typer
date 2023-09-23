Class {
	#name : #TypInfExceptionHandlingBlockContext,
	#superclass : #TypInfBlockContext,
	#instVars : [
		'exceptionHandler',
		'exception'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfExceptionHandlingBlockContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessage block: aBlock [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfExceptionHandlingBlockContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessage block: aBlock exception: anException exceptionHandler: anotherNode [
	^ (super
		sender: aContext
		state: aState
		node: aNode
		self: aType
		super: anotherType
		message: aMessage
		block: aBlock)
		initializeException: anException exceptionHandler: anotherNode;
		yourself
]

{ #category : #accessing }
TypInfExceptionHandlingBlockContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ exceptionHandler = anObject exceptionHandler
]

{ #category : #accessing }
TypInfExceptionHandlingBlockContext >> exceptionHandler [
	^ exceptionHandler
]

{ #category : #accessing }
TypInfExceptionHandlingBlockContext >> hash [
	^ super hash bitXor: exceptionHandler hash
]

{ #category : #accessing }
TypInfExceptionHandlingBlockContext >> initializeException: anExceptionSet exceptionHandler: anotherNode [
	exception := anExceptionSet.
	exceptionHandler := anotherNode
]

{ #category : #accessing }
TypInfExceptionHandlingBlockContext >> newExceptionHandlerContextOrNil: aSignalMessage [
	(exception handles: aSignalMessage context exception classDescription new)
		ifTrue: [ ^ TypInfBlockContext
				sender: self
				state: root state copy
				node: exceptionHandler node
				self: exceptionHandler context self
				super: exceptionHandler context super
				message: aSignalMessage
				block: exceptionHandler ].
	^ super newExceptionHandlerContextOrNil: aSignalMessage
]
