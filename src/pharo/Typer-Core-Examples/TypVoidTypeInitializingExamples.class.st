Class {
	#name : #TypVoidTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #accessing }
TypVoidTypeInitializingExamples >> typeInstance [
	<gtExample>
	| type |
	type := TypVoidType instance.
	self assert: type hasSuperType not.
	self assert: type == TypVoidType instance description: 'void instance should always be the exact same object'.
	^ type
]
