Class {
	#name : #TypNilTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Printing'
}

{ #category : #accessing }
TypNilTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypNilTypeInitializingExamples new typeInstance.
	self assert: type asString equals: '!'.
	^ type
]