Class {
	#name : #TypInfSignalMessage,
	#superclass : #TypInfMessage,
	#instVars : [
		'exception'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSignalMessage class >> node: aNode context: aContext [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfSignalMessage class >> node: aNode context: aContext exception: anException [
	^ (super node: aNode context: aContext)
		exception: anException;
		yourself
]

{ #category : #accessing }
TypInfSignalMessage >> canInstall [
	^ (context newExceptionHandlerContextOrNil: exception) isNotNil
]

{ #category : #accessing }
TypInfSignalMessage >> exception: anException [
	self assert: [ (anException isKindOf: TypType) not ].
	exception := anException
]

{ #category : #accessing }
TypInfSignalMessage >> inReturns [
	^ {self}
]

{ #category : #accessing }
TypInfSignalMessage >> newContexts [
	^ (context newExceptionHandlerContextOrNil: exception)
		ifNil: [ {} ]
		ifNotNil: [ :c | 
			^ {lookup
					-> (c
							initializeMessage: self;
							yourself)} ]
]

{ #category : #accessing }
TypInfSignalMessage >> transfer [
	super transfer.
	contexts
		ifNotEmpty: [ :c | 
			| arguments |
			arguments := c anyOne value root inArguments.
			arguments
				ifNotEmpty: [ self constrain: arguments first to: exception nonAnonymousClass typAsType ] ]
]
