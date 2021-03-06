Class {
	#name : #TypVariableTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #accessing }
TypVariableTypeInitializingExamples >> named [
	<gtExample>
	| type |
	type := TypVariableType named: '@A'.
	self assert: type name equals: '@A'.
	self assert: type hasSuperType.
	self assert: type superType equals: (TypNamedType classDescription: ProtoObject).
	^ type
]

{ #category : #accessing }
TypVariableTypeInitializingExamples >> namedInvalid [
	<gtExample>
	self
		assert: [ TypVariableType named: 'A' ]
		signals: AssertionFailure.
	^ nil
]

{ #category : #accessing }
TypVariableTypeInitializingExamples >> namedSuperType [
	<gtExample>
	| type |
	type := TypVariableType named: '@A' superType: (TypNamedType classDescription: String).
	self assert: type name equals: '@A'.
	self assert: type hasSuperType.
	self assert: type superType equals: (TypNamedType classDescription: String).
	^ type
]
