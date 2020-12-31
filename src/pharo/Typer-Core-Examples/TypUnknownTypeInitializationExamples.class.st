Class {
	#name : #TypUnknownTypeInitializationExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initialization'
}

{ #category : #accessing }
TypUnknownTypeInitializationExamples >> typeInstance [
	<gtExample>
	| type |
	type := TypUnknownType instance.
	self assert: type hasSuperType not.
	self assert: type == TypUnknownType instance description: 'unknown instance should always be the exact same object'.
	^ type
]
