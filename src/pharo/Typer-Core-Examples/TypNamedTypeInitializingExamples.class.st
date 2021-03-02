Class {
	#name : #TypNamedTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #'as yet unclassified' }
TypNamedTypeInitializingExamples >> classDescription [
	<gtExample>
	| type |
	type := TypNamedType classDescription: Integer.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self assert: type superType equals: (TypNamedType classDescription: Number).
	^ type
]

{ #category : #'as yet unclassified' }
TypNamedTypeInitializingExamples >> namedWithClassDescription [
	<gtExample>
	| type |
	type := TypNamedType named: 'Integer'.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self assert: type superType equals: (TypNamedType classDescription: Number).
	^ type
]

{ #category : #'as yet unclassified' }
TypNamedTypeInitializingExamples >> namedWithoutClassDescription [
	<gtExample>
	| type |
	type := TypNamedType named: 'Nothing'.
	self assert: type name equals: 'Nothing'.
	self assert: type hasClassDescription not.
	self assert: [ type classDescription ] signals: AssertionFailure.
	self assert: type hasSuperType not.
	self assert: [ type superType ] signals: AssertionFailure.
	^ type
]
