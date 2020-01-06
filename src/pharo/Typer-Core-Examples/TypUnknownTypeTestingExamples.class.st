Class {
	#name : #TypUnknownTypeTestingExamples,
	#superclass : #TypTypeTestingExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #testing }
TypUnknownTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown.
	^ type
]

{ #category : #generated }
TypUnknownTypeTestingExamples >> type [
	^ TypUnknownType instance
]
