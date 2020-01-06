Class {
	#name : #TypNoTypeTestingExamples,
	#superclass : #TypTypeTestingExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #testing }
TypNoTypeTestingExamples >> isNoType [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNoType.
	^ type
]

{ #category : #generated }
TypNoTypeTestingExamples >> type [
	^ TypNoType instance
]
