Class {
	#name : #TypUnknownTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Printing'
}

{ #category : #accessing }
TypUnknownTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypUnknownTypeInitializingExamples new typeInstance.
	self assert: type asString equals: '?'.
	^ type
]
