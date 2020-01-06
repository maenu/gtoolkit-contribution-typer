Class {
	#name : #TypTypeInstantiationExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Instantiation'
}

{ #category : #testing }
TypTypeInstantiationExamples class >> isAbstract [
	^ self == TypTypeInstantiationExamples
]

{ #category : #asserting }
TypTypeInstantiationExamples >> assert: aBlock signals: aClass [
	| signaled |
	signaled := false.
	aBlock
		on: aClass
		do: [ signaled := true ].
	self assert: signaled
]
