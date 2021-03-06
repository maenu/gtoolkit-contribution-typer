Class {
	#name : #TypFunctionTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> classDescriptionArgumentsSizeArgumentsOptionalBindings [
	<gtExample>
	| type |
	type := TypFunctionType
		classDescription: Integer
		result: (TypNamedType classDescription: Boolean)
		arguments: {(TypNamedType classDescription: Float)}
		argumentsOptional: true
		signalsAlways: true.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self
		assert: type superType
		equals: (TypNamedType classDescription: Number).
	self assert: type parameters keys equals: {'@0' . '@1'}.
	self assert: type argumentsOptional equals: true.
	self assert: type argumentsSize equals: 1.
	self
		assert: type arguments
		equals: {(TypNamedType classDescription: Float)}.
	self
		assert: type result
		equals: (TypNamedType classDescription: Boolean).
	self assert: type signalsAlways equals: true.
	^ type
]

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> classDescriptionParameters [
	<gtExample>
	self
		assert: [ TypFunctionType classDescription: Integer parameters: {'@A'} ]
		signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> namedArgumentsSizeArgumentsOptionalBindings [
	<gtExample>
	| type |
	type := TypFunctionType
		named: 'Integer'
		result: (TypNamedType classDescription: Boolean)
		arguments: {(TypNamedType classDescription: Float)}
		argumentsOptional: true
		signalsAlways: true.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self
		assert: type superType
		equals: (TypNamedType classDescription: Number).
	self assert: type parameters keys equals: {'@0' . '@1'}.
	self assert: type argumentsOptional equals: true.
	self assert: type argumentsSize equals: 1.
	self
		assert: type arguments
		equals: {(TypNamedType classDescription: Float)}.
	self
		assert: type result
		equals: (TypNamedType classDescription: Boolean).
	self assert: type signalsAlways equals: true.
	^ type
]

{ #category : #'as yet unclassified' }
TypFunctionTypeInitializingExamples >> namedParameters [
	<gtExample>
	self
		assert: [ TypFunctionType named: 'Integer' parameters: {'@A'} ]
		signals: ShouldNotImplement.
	^ nil
]
