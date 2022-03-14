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
	self assert: (type asNarrower: superType) equals: type.
	self assert: (superType asNarrower: type) equals: type.
	^ type
]
