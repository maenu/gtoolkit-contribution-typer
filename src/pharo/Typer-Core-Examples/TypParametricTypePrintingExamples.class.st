Class {
	#name : #TypParametricTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Printing'
}

{ #category : #accessing }
TypParametricTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypParametricTypeInitializingExamples new classDescriptionParameters.
	self assert: type asString equals: 'Integer<@A>'.
	^ type
]

{ #category : #accessing }
TypParametricTypePrintingExamples >> asStringRecursive [
	<gtExample>
	| type |
	type := TypParametricTypeInitializingExamples new classDescriptionParameters.
	type at: '@A' put: type.
	self assert: type asString equals: 'Integer<.>'.
	^ type
]
