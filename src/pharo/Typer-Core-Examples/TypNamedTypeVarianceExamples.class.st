Class {
	#name : #TypNamedTypeVarianceExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Variance'
}

{ #category : #'as yet unclassified' }
TypNamedTypeVarianceExamples >> contravariance [

	<gtExample>
	| type superType |
	type := TypNamedTypeInitializingExamples new classDescription.
	superType := type super.
	self assert: (type contravariantWith: superType) equals: superType.
	self assert: (superType contravariantWith: type) equals: superType.
	^ type
]

{ #category : #'as yet unclassified' }
TypNamedTypeVarianceExamples >> covariance [

	<gtExample>
	| type superType |
	type := TypNamedTypeInitializingExamples new classDescription.
	superType := type super.
	self assert: (type covariantWith: superType) equals: type.
	self assert: (superType covariantWith: type) equals: type.
	^ type
]
