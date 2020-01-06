Class {
	#name : #TypTypeVariableTypeTestingExamples,
	#superclass : #TypTypeTestingExamples,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypTypeVariableTypeTestingExamples >> isTypeVariable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isTypeVariable.
	^ type
]

{ #category : #generated }
TypTypeVariableTypeTestingExamples >> type [
	^ TypTypeVariableType named: '@A'
]
