Class {
	#name : #TypNoTypeTestingExamples,
	#superclass : #TypTypeTestingExamples,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypNoTypeTestingExamples >> isVoidType [
	<gtExample>
	| type |
	type := self type.
	self assert: type isVoidType.
	^ type
]

{ #category : #generated }
TypNoTypeTestingExamples >> type [
	^ TypVoidType instance
]
