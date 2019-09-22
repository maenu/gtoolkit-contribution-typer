Class {
	#name : #TypNamedTypeExamples,
	#superclass : #TypTypeExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #converting }
TypNamedTypeExamples >> asNamedType [
	<gtExample>
	| type |
	type := self type.
	self assert: type asNamedType == type.
	^ type
]

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
	self assert: (type asTypeCompatibleWith: self typeInteger) = type.
	self
		assert:
			(type asTypeCompatibleWith: self typeProtoObject)
				= self typeProtoObject.
	self
		assert:
			(type asTypeCompatibleWith: self typeNotAClass)
				= TypUnknownType instance.
	^ type
]

{ #category : #testing }
TypNamedTypeExamples >> classDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type classDescription = Object.
	self assert: self typeObjectClass classDescription = Object class.
	self assert: self typeTAssertable classDescription = TAssertable.
	self
		assert:
			self typeTAssertableClassTrait classDescription = TAssertable class.
	^ type
]

{ #category : #testing }
TypNamedTypeExamples >> hasSuperType [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasSuperType.
	self assert: self typeObjectClass hasSuperType.
	self assert: self typeProtoObject hasSuperType not.
	self assert: self typeProtoObjectClass hasSuperType.
	self assert: self typeNotAClass hasSuperType not.
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
	self assert: self typeNotAClass representsClassDescription not.
	self assert: self typeObjectClass representsClassDescription.
	self assert: self typeTAssertable representsClassDescription.
	self
		assert: self typeTAssertableClassTrait representsClassDescription.
	^ type
]

{ #category : #testing }
TypNamedTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self assert: type superType = self typeProtoObject.
	self
		assert: self typeObjectClass superType = self typeProtoObjectClass.
	self
		assert: self typeProtoObjectClass superType = (TypNamedType named: 'Class').
	^ type
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> type [
	<gtExample>
	^ self typeObject
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> typeInteger [
	<gtExample>
	^ TypNamedType named: 'Integer'
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> typeNotAClass [
	<gtExample>
	^ TypNamedType named: 'notaclass'
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> typeObject [
	<gtExample>
	^ TypNamedType named: 'Object'
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> typeObjectClass [
	<gtExample>
	^ TypNamedType named: 'Object class'
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> typeProtoObject [
	<gtExample>
	^ TypNamedType named: 'ProtoObject'
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> typeProtoObjectClass [
	<gtExample>
	^ TypNamedType named: 'ProtoObject class'
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> typeTAssertable [
	<gtExample>
	^ TypNamedType named: 'TAssertable'
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> typeTAssertableClassTrait [
	<gtExample>
	^ TypNamedType named: 'TAssertable classTrait'
]
