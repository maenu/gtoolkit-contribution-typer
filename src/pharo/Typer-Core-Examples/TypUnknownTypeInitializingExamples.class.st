Class {
	#name : #TypUnknownTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #accessing }
TypUnknownTypeInitializingExamples >> typeInstance [
	<gtExample>
	| type |
	type := TypUnknownType new.
	self assert: type hasSuperType not.
	self
		assert: type == TypUnknownType new
		description: 'unknown instance should always be the exact same object'.
	^ type
]
