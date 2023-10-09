Class {
	#name : #TypInfSignalMessage,
	#superclass : #TypInfMessage,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSignalMessage >> newContexts [
	context stack
		reverseDo: [ :c | 
			(c handles: context exception)
				ifTrue: [ ^ {lookup -> (c newExceptionHandlerContext: self)} ] ].
	^ #()
]

{ #category : #accessing }
TypInfSignalMessage >> transfer [
	super transfer.
	state at: self put: TypVoidType instance.
	contexts
		ifNotEmpty: [ :c | 
			| arguments |
			arguments := c anyOne value root inArguments.
			arguments
				ifNotEmpty: [ self constrain: arguments first to: context exception ] ]
]
