Class {
	#name : #TypLoggingErrorHandler,
	#superclass : #Object,
	#traits : 'TAsyncErrorHandler',
	#classTraits : 'TAsyncErrorHandler classTrait',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Typer-Core-Logging'
}

{ #category : #accessing }
TypLoggingErrorHandler class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'error handling' }
TypLoggingErrorHandler >> handleError: anException [
	TypExceptionSignal emit: anException
]
