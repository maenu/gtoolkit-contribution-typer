Class {
	#name : #TypFunctionTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Printing'
}

{ #category : #accessing }
TypFunctionTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new classDescriptionArgumentsSizeArgumentsOptionalBindings.
	self assert: type asString equals: '[Float]->void'.
	^ type
]

{ #category : #accessing }
TypFunctionTypePrintingExamples >> asStringRecursive [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new classDescriptionArgumentsSizeArgumentsOptionalBindings copy.
	(type instVarNamed: #parameters) at: #'1' put: type.
	self assert: type asString equals: '[.]->void'.
	^ type
]
