Class {
	#name : #TypNamedTypeTestingExamples,
	#superclass : #TypTypeTestingExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #testing }
TypNamedTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed.
	^ type
]

{ #category : #generated }
TypNamedTypeTestingExamples >> type [
	^ TypNamedType named: 'Object'
]
