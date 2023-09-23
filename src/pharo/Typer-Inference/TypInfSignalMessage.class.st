Class {
	#name : #TypInfSignalMessage,
	#superclass : #TypInfMessage,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSignalMessage >> newContexts [
	^ (context newExceptionHandlerContextOrNil: self)
		ifNil: [ {} ]
		ifNotNil: [ :c | ^ {lookup -> c} ]
]

{ #category : #accessing }
TypInfSignalMessage >> transfer [
	super transfer.
	contexts
		ifNotEmpty: [ :c | 
			| arguments |
			arguments := c anyOne value root inArguments.
			arguments
				ifNotEmpty: [ self constrain: arguments first to: context exception ] ]
]
