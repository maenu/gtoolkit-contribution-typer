Class {
	#name : #TypVariableTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Initializing'
}

{ #category : #accessing }
TypVariableTypeInitializingExamples >> named [
	<gtExample>
	| type |
	type := TypVariableType named: #A.
	self assert: type name equals: #A.
	self assert: type hasSuper.
	self assert: type super equals: (TypNamedType classDescription: ProtoObject).
	^ type
]

{ #category : #accessing }
TypVariableTypeInitializingExamples >> namedInvalid [
	<gtExample>
	self
		assert: [ TypVariableType named: '' ]
		signals: AssertionFailure.
	^ nil
]

{ #category : #accessing }
TypVariableTypeInitializingExamples >> namedSuperType [
	<gtExample>
	| type |
	type := TypVariableType named: #A super: (TypNamedType classDescription: String).
	self assert: type name equals: #A.
	self assert: type hasSuper.
	self assert: type super equals: (TypNamedType classDescription: String).
	^ type
]
