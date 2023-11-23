Class {
	#name : #TypInfSignalMessage,
	#superclass : #TypInfMessage,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSignalMessage >> newContexts [
	context
		stackDo: [ :c | 
			(c handles: context exception)
				ifTrue: [ ^ {c newExceptionHandlerContext: self} ] ].
	^ #()
]

{ #category : #accessing }
TypInfSignalMessage >> signalsAlways [
	^ (in at: #signal) anyOne exception
]

{ #category : #accessing }
TypInfSignalMessage >> signalsMaybe [
	^ nil
]

{ #category : #accessing }
TypInfSignalMessage >> transfer [
	super transfer.
	self put: TypVoidType instance.
	contexts
		ifNotEmpty: [ contexts anyOne value root inArguments
				ifNotEmpty: [ :a | self constrain: a first to: context exception ] ]
]
