Class {
	#name : #TypNilTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Printing'
}

{ #category : #accessing }
TypNilTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypNilTypeInitializingExamples new new.
	self assert: type asString equals: '!'.
	^ type
]
