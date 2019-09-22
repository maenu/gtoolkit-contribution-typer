Class {
	#name : #TypExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples'
}

{ #category : #asserting }
TypExamples >> assert: aBlock signals: aClass [
	| signaled |
	signaled := false.
	aBlock
		on: aClass
		do: [ signaled := true ].
	self assert: signaled
]
