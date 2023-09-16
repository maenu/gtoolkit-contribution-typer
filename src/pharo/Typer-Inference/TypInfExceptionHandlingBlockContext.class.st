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
TypInfExceptionHandlingBlockContext >> initializeException: anExceptionSet exceptionHandler: anotherNode [
	exception := anExceptionSet.
	exceptionHandler := anotherNode
]

{ #category : #accessing }
TypInfExceptionHandlingBlockContext >> newExceptionHandlerContextOrNil: anException [
	(exception handles: anException)
		ifTrue: [ ^ TypInfBlockContext
				sender: self
				state: root state copy
				node: exceptionHandler node
				self: exceptionHandler context self
				super: exceptionHandler context super
				message: message
				block: exceptionHandler ].
	^ super newExceptionHandlerContextOrNil: anException
]
