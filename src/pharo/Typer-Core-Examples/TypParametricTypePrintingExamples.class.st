Class {
	#name : #TypParametricTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Printing'
}

{ #category : #accessing }
TypParametricTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypParametricTypeInitializingExamples new classDescriptionParameters.
	self assert: type asString equals: 'Integer<#A>'.
	^ type
]

{ #category : #accessing }
TypParametricTypePrintingExamples >> asStringRecursive [

	<gtExample>
	| type | 
	type := TypParametricTypeInitializingExamples new
		        classDescriptionParameters copy.
	(type instVarNamed: #parameters) at: #A put: type.
	self assert: type asString equals: 'Integer<.>'.
	^ type
]
