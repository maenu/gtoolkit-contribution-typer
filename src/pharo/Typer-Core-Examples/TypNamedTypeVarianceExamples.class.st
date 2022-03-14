Class {
	#name : #TypNamedTypeVarianceExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Variance'
}

{ #category : #'as yet unclassified' }
TypNamedTypeVarianceExamples >> assignable [

	<gtExample>
	| type superType |
	type := TypNamedTypeInitializingExamples new classDescription.
	superType := type super.
	self assert: (type withNarrow: superType) equals: type.
	self assert: (superType withNarrow: type) equals: type.
	^ type
]
