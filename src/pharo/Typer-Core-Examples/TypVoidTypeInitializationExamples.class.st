Class {
	#name : #TypVoidTypeInitializationExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initialization'
}

{ #category : #accessing }
TypVoidTypeInitializationExamples >> typeInstance [
	<gtExample>
	| type |
	type := TypVoidType instance.
	self assert: type hasSuperType not.
	self assert: type == TypVoidType instance description: 'void instance should always be the exact same object'.
	^ type
]
