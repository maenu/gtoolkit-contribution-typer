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
TypInfExceptionHandlingBlockContext class >> sender: aContext state: aState node: aNode lookup: aLookup message: aMessage block: aBlock [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfExceptionHandlingBlockContext class >> sender: aContext state: aState node: aNode lookup: aLookup message: aMessage block: aBlock exception: anException exceptionHandler: anotherNode [
	^ (super
		sender: aContext
		state: aState
		node: aNode
		lookup: aLookup
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
TypInfExceptionHandlingBlockContext >> handles: anExceptionType [
	^ exception handles: anExceptionType classDescription new
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
TypInfExceptionHandlingBlockContext >> newExceptionHandlerContext: aSignalMessage [
	self assert: [ self handles: aSignalMessage context exception ].
	^ TypInfBlockContext
		sender: self
		state: root state
		node: exceptionHandler node
		lookup: exceptionHandler context lookup
		message: aSignalMessage
		block: exceptionHandler
]
