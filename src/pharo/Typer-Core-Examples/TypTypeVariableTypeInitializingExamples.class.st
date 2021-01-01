Class {
	#name : #TypTypeVariableTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #accessing }
TypTypeVariableTypeInitializingExamples >> typeNamed [
	<gtExample>
	| type |
	type := TypTypeVariableType named: '@A'.
	self assert: type name equals: '@A'.
	self assert: type hasSuperType.
	self assert: type superType equals: (TypNamedType classDescription: ProtoObject).
	^ type
]

{ #category : #accessing }
TypTypeVariableTypeInitializingExamples >> typeNamedInvalid [
	<gtExample>
	self
		assert: [ TypTypeVariableType named: 'A' ]
		signals: AssertionFailure.
	^ nil
]

{ #category : #accessing }
TypTypeVariableTypeInitializingExamples >> typeNamedSuperType [
	<gtExample>
	| type |
	type := TypTypeVariableType named: '@A' superType: (TypNamedType classDescription: String).
	self assert: type name equals: '@A'.
	self assert: type hasSuperType.
	self assert: type superType equals: (TypNamedType classDescription: String).
	^ type
]
