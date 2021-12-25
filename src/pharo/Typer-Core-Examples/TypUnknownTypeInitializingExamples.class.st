Class {
	#name : #TypUnknownTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #accessing }
TypUnknownTypeInitializingExamples >> new [

	<gtExample>
	| type |
	type := TypUnknownType instance.
	self assert: type hasSuper not.
	^ type
]
