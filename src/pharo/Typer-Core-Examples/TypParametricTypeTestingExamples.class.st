Class {
	#name : #TypParametricTypeTestingExamples,
	#superclass : #TypNamedTypeTestingExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #testing }
TypParametricTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric.
	^ type
]

{ #category : #'as yet unclassified' }
TypParametricTypeTestingExamples >> type [
	^ TypParametricType
		named: 'OrderedCollection'
		parameters: {'@A'}
		bindings: {('@A' -> Integer typAsType)} asDictionary
]
