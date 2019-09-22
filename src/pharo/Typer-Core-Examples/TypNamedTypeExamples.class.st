Class {
	#name : #TypNamedTypeExamples,
	#superclass : #TypTypeExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> asTypeCompatibleWith [
	<gtExample>
	| type |
	type := self type.
	self
		assert:
			(type asTypeCompatibleWith: TypUnknownType instance)
				= TypUnknownType instance.
	self
		assert: (type asTypeCompatibleWith: TypNilType instance) = type asNullableType.
	self
		assert: (type asTypeCompatibleWith: (TypNamedType named: 'Integer')) = type.
	self
		assert:
			(type asTypeCompatibleWith: (TypNamedType named: 'ProtoObject'))
				= (TypNamedType named: 'ProtoObject').
	self
		assert:
			(type asTypeCompatibleWith: (TypNamedType named: 'notaclass'))
				= TypUnknownType instance.
	^ type
]

{ #category : #testing }
TypNamedTypeExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed.
	^ type
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> printOn [
	<gtExample>
	| type |
	type := self type.
	self assert: type asString = 'Object'.
	self assert: type asNullableType asString = '!Object'.
	^ type
]

{ #category : #testing }
TypNamedTypeExamples >> representsClassDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type representsClassDescription.
	self assert: (TypNamedType named: 'notaclass') representsClassDescription not.
	self assert: (TypNamedType named: 'Object class') representsClassDescription.
	self assert: (TypNamedType named: 'TAssertable') representsClassDescription.
	self assert: (TypNamedType named: 'TAssertable classTrait') representsClassDescription.
	^ type
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> type [
	<gtExample>
	^ TypNamedType named: 'Object'
]
