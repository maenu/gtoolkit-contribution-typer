Class {
	#name : #TypVoidTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Printing'
}

{ #category : #accessing }
TypVoidTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypVoidTypeInitializingExamples new typeInstance.
	self assert: type asString equals: 'void'.
	^ type
]
