Class {
	#name : #TypFunctionTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Printing'
}

{ #category : #accessing }
TypFunctionTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new typeClassDescriptionArgumentsSize.
	self assert: type asString equals: 'Integer(@1)->@0'.
	^ type
]

{ #category : #accessing }
TypFunctionTypePrintingExamples >> asStringRecursive [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new typeClassDescriptionArgumentsSize.
	type at: '@1' put: type.
	self assert: type asString equals: 'Integer(.)->@0'.
	^ type
]
