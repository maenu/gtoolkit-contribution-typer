Class {
	#name : #TypGtExpandContextRequest,
	#superclass : #BlEvent,
	#instVars : [
		'context'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtExpandContextRequest class >> context: aContext [
	^ self new
		initializeContext: aContext;
		yourself
]

{ #category : #accessing }
TypGtExpandContextRequest >> context [
	^ context
]

{ #category : #accessing }
TypGtExpandContextRequest >> contextChain [
	| chain current |
	current := context.
	chain := OrderedCollection new.
	[ current ~~ self and: [ current sender isNotNil ] ]
		whileTrue: [ chain addFirst: current.
			current := current sender ].
	^ chain
]

{ #category : #accessing }
TypGtExpandContextRequest >> initializeContext: aContext [
	context := aContext
]
