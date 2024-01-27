Class {
	#name : #TypExceptionSignal,
	#superclass : #ExceptionSignal,
	#category : #'Typer-Core-Logging'
}

{ #category : #accessing }
TypExceptionSignal class >> emit: anException [
	^ (self new
		exception: anException;
		stack: (anException signalContext
				ifNil: [ #() ]
				ifNotNil: [ anException signalerContext stack collect: [ :each | each sourceNodeExecuted ] ]))
		emit
]
