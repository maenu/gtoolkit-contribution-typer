Class {
	#name : #TypVoidTypeTestingExamples,
	#superclass : #TypTypeTestingExamples,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypVoidTypeTestingExamples >> isVoidType [
	<gtExample>
	| type |
	type := self type.
	self assert: type isVoidType.
	^ type
]

{ #category : #generated }
TypVoidTypeTestingExamples >> type [
	^ TypVoidType instance
]
