Class {
	#name : #TypNamedTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Printing'
}

{ #category : #accessing }
TypNamedTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypNamedTypeInitializingExamples new typeClassDescription.
	self assert: type asString equals: 'Integer'.
	^ type
]
