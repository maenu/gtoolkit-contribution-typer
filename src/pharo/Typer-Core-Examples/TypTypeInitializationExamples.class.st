Class {
	#name : #TypTypeInitializationExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Initialization'
}

{ #category : #testing }
TypTypeInitializationExamples class >> isAbstract [
	^ self == TypTypeInitializationExamples
]

{ #category : #asserting }
TypTypeInitializationExamples >> assert: aBlock signals: aClass [
	| signaled |
	signaled := false.
	aBlock
		on: aClass
		do: [ signaled := true ].
	self assert: signaled
]
