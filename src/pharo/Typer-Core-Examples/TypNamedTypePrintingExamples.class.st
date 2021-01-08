Class {
	#name : #TypNamedTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Printing'
}

{ #category : #accessing }
TypNamedTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypNamedTypeInitializingExamples
		typGtExampleValue: #typeClassDescription.
	self assert: type asString equals: 'Integer'.
	^ type
]
