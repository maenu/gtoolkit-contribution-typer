Class {
	#name : #TypNilTypeTestingExamples,
	#superclass : #TypNamedTypeTestingExamples,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypNilTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil.
	^ type
]

{ #category : #generated }
TypNilTypeTestingExamples >> type [
	^ TypNilType instance
]
