Class {
	#name : #TypNamedTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Printing'
}

{ #category : #accessing }
TypNamedTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypNamedTypeInitializingExamples new classDescription.
	self assert: type asString equals: 'Integer'.
	^ type
]
