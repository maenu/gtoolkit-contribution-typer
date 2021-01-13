Class {
	#name : #TypUnionTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Printing'
}

{ #category : #accessing }
TypUnionTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypUnionTypeInitializingExamples new typesMany.
	self assert: type asString equals: '{!,?}'.
	^ type
]
