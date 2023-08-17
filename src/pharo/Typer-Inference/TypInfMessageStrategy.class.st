Class {
	#name : #TypInfMessageStrategy,
	#superclass : #Object,
	#instVars : [
		'message'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMessageStrategy class >> message: aMessage [
	^ self new
		initializeMessage: aMessage;
		yourself
]

{ #category : #accessing }
TypInfMessageStrategy >> canInstall [
	self subclassResponsibility
]

{ #category : #accessing }
TypInfMessageStrategy >> constrainedReceiver [
	| receiver implementors |
	receiver := message receiver.
	receiver isUnknown ifFalse: [ ^ receiver ].
	implementors := TypInfMethodIndex instance implementors: message selector.
	(implementors size between: 1 and: 8) ifFalse: [ ^ receiver ].
	^ (implementors collect: #typAsType) typAsType
]

{ #category : #accessing }
TypInfMessageStrategy >> initializeMessage: aMessage [
	message := aMessage
]

{ #category : #accessing }
TypInfMessageStrategy >> install [
	
]

{ #category : #accessing }
TypInfMessageStrategy >> transfer [
	
]

{ #category : #accessing }
TypInfMessageStrategy >> uninstall [
	
]
