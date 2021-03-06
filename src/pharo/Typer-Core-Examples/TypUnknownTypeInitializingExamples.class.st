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
	type := TypUnknownType new.
	self assert: type hasSuperType not.
	^ type
]
