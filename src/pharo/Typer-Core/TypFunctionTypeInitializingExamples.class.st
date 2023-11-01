Class {
	#name : #TypFunctionTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Initializing'
}

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> classDescriptionArgumentsSizeArgumentsOptionalBindings [
	<gtExample>
	| type |
	type := TypFunctionType
			classDescription: Integer
			result: TypVoidType instance
			arguments: {TypNamedType classDescription: Float}
			argumentsOptional: true
			signalsAlways: Error typAsType
			signalsMaybe: nil
			node: nil.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuper.
	self assert: type super equals: (TypNamedType classDescription: Number).
	self
		assert: type parameters keys
		equals: {#'0'.
				#'1'}.
	self assert: type argumentsOptional equals: true.
	self assert: type argumentsSize equals: 1.
	self assert: type arguments equals: {TypNamedType classDescription: Float}.
	self assert: type result equals: TypVoidType instance.
	self assert: type signalsAlways equals: Error typAsType.
	^ type
]

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> classDescriptionParameters [
	<gtExample>
	self
		assert: [ TypFunctionType classDescription: Integer parameters: {#A} ]
		signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> namedArgumentsSizeArgumentsOptionalBindings [
	<gtExample>
	| type |
	type := TypFunctionType
			named: 'Integer'
			result: TypVoidType instance
			arguments: {TypNamedType classDescription: Float}
			argumentsOptional: true
			signalsAlways: Error typAsType
			signalsMaybe: nil
			node: nil.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuper.
	self assert: type super equals: (TypNamedType classDescription: Number).
	self
		assert: type parameters keys
		equals: {#'0'.
				#'1'}.
	self assert: type argumentsOptional equals: true.
	self assert: type argumentsSize equals: 1.
	self assert: type arguments equals: {TypNamedType classDescription: Float}.
	self assert: type result equals: TypVoidType instance.
	self assert: type signalsAlways equals: Error typAsType.
	^ type
]

{ #category : #accessing }
TypFunctionTypeInitializingExamples >> namedParameters [
	<gtExample>
	self
		assert: [ TypFunctionType named: 'Integer' parameters: {#A} ]
		signals: ShouldNotImplement.
	^ nil
]
