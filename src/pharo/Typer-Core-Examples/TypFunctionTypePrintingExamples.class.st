Class {
	#name : #TypFunctionTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Printing'
}

{ #category : #accessing }
TypFunctionTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new classDescriptionArgumentsSizeArgumentsOptionalBindings.
	self assert: type asString equals: 'Integer[Float]->Boolean'.
	^ type
]

{ #category : #accessing }
TypFunctionTypePrintingExamples >> asStringRecursive [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new classDescriptionArgumentsSizeArgumentsOptionalBindings.
	type parameters at: '@1' put: type.
	self assert: type asString equals: 'Integer[.]->Boolean'.
	^ type
]
