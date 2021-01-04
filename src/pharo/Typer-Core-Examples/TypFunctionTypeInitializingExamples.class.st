Class {
	#name : #TypFunctionTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #'as yet unclassified' }
TypFunctionTypeInitializingExamples >> typeClassDescriptionArgumentsSize [
	<gtExample>
	| type |
	self
		assert: [ TypFunctionType classDescription: Integer argumentsSize: -1 ]
		signals: AssertionFailure.
	self
		assert: [ TypFunctionType classDescription: Integer argumentsSize: 1.2 ]
		signals: AssertionFailure.
	type := TypFunctionType classDescription: Integer argumentsSize: 1.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self
		assert: type superType
		equals: (TypNamedType classDescription: Number).
	self assert: type parameters equals: {'@0' . '@1'}.
	self assert: type argumentsOptional equals: false.
	self assert: type argumentsSize equals: 1.
	self
		assert: type arguments
		equals: {(TypTypeVariableType named: '@1')}.
	self assert: type result equals: (TypTypeVariableType named: '@0').
	^ type
]

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> typeClassDescriptionArgumentsSizeArgumentsOptional [
	<gtExample>
	| type |
	type := TypFunctionType
		classDescription: Integer
		argumentsSize: 1
		argumentsOptional: true.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self
		assert: type superType
		equals: (TypNamedType classDescription: Number).
	self assert: type parameters equals: {'@0' . '@1'}.
	self assert: type argumentsOptional equals: true.
	self assert: type argumentsSize equals: 1.
	self
		assert: type arguments
		equals: {(TypTypeVariableType named: '@1')}.
	self assert: type result equals: (TypTypeVariableType named: '@0').
	^ type
]

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> typeClassDescriptionArgumentsSizeArgumentsOptionalBindings [
	<gtExample>
	| type |
	type := TypFunctionType
		classDescription: Integer
		argumentsSize: 1
		argumentsOptional: true
		bindings:
			{('@0' -> (TypNamedType classDescription: Boolean)).
			('@1' -> (TypNamedType classDescription: Float))} asDictionary.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self
		assert: type superType
		equals: (TypNamedType classDescription: Number).
	self assert: type parameters equals: {'@0' . '@1'}.
	self assert: type argumentsOptional equals: true.
	self assert: type argumentsSize equals: 1.
	self
		assert: type arguments
		equals: {(TypNamedType classDescription: Float)}.
	self
		assert: type result
		equals: (TypNamedType classDescription: Boolean).
	^ type
]

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> typeClassDescriptionParameters [
	<gtExample>
	self
		assert: [ TypFunctionType classDescription: Integer parameters: {'@A'} ]
		signals: ShouldNotImplement.
	^ nil
]

{ #category : #'as yet unclassified' }
TypFunctionTypeInitializingExamples >> typeNamedArgumentsSize [
	<gtExample>
	| type |
	type := TypParametricType
		named: 'Integer'
		parameters: {'@A'}.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self assert: type superType equals: (TypNamedType classDescription: Number).
	^ type
]

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> typeNamedArgumentsSizeArgumentsOptional [
	<gtExample>
	| type |
	type := TypFunctionType
		named: 'Integer'
		argumentsSize: 1
		argumentsOptional: true.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self
		assert: type superType
		equals: (TypNamedType classDescription: Number).
	self assert: type parameters equals: {'@0' . '@1'}.
	self assert: type argumentsOptional equals: true.
	self assert: type argumentsSize equals: 1.
	self
		assert: type arguments
		equals: {(TypTypeVariableType named: '@1')}.
	self assert: type result equals: (TypTypeVariableType named: '@0').
	^ type
]

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> typeNamedArgumentsSizeArgumentsOptionalBindings [
	<gtExample>
	| type |
	type := TypFunctionType
		named: 'Integer'
		argumentsSize: 1
		argumentsOptional: true
		bindings:
			{('@0' -> (TypNamedType classDescription: Boolean)).
			('@1' -> (TypNamedType classDescription: Float))} asDictionary.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self
		assert: type superType
		equals: (TypNamedType classDescription: Number).
	self assert: type parameters equals: {'@0' . '@1'}.
	self assert: type argumentsOptional equals: true.
	self assert: type argumentsSize equals: 1.
	self
		assert: type arguments
		equals: {(TypNamedType classDescription: Float)}.
	self
		assert: type result
		equals: (TypNamedType classDescription: Boolean).
	^ type
]

{ #category : #'as yet unclassified' }
TypFunctionTypeInitializingExamples >> typeNamedWithClassDescriptionParameters [
	<gtExample>
	self
		assert: [ TypFunctionType named: 'Integer' parameters: {'@A'} ]
		signals: ShouldNotImplement.
	^ nil
]

{ #category : #'as yet unclassified' }
TypFunctionTypeInitializingExamples >> typeNamedWithoutClassDescriptionParameters [
	<gtExample>
	self
		assert: [ TypFunctionType named: 'Nothing' parameters: {'@A'} ]
		signals: ShouldNotImplement.
	^ nil
]