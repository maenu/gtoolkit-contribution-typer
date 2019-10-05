Class {
	#name : #TypNilTypeExamples,
	#superclass : #TypNamedTypeExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #converting }
TypNilTypeExamples >> asNonNullableType [
	<gtExample>
	| type nonNullableType |
	type := self type.
	nonNullableType := type asNonNullableType.
	self assert: nonNullableType isNullable not.
	self assert: nonNullableType = TypUnknownType instance.
	^ nonNullableType
]

{ #category : #converting }
TypNilTypeExamples >> asNullableType [
	<gtExample>
	| type nullableType |
	type := self type.
	nullableType := type asNullableType.
	self assert: nullableType isNullable.
	self assert: nullableType == type.
	self assert: nullableType >= type.
	self assert: nullableType asNonNullableType = TypUnknownType instance.
	^ nullableType
]

{ #category : #testing }
TypNilTypeExamples >> classDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type classDescription = UndefinedObject.
	^ type
]

{ #category : #copying }
TypNilTypeExamples >> copy_ [
	<gtExample>
	| type |
	type := self type.
	self assert: type copy == type.
	^ type
]

{ #category : #accessing }
TypNilTypeExamples >> equality [
	<gtExample>
	| type other |
	type := self type.
	other := self type.
	self assert: type == other.
	self assert: type hash = other hash.
	self assert: type = other.
	self assert: type asNullableType hash = other hash.
	self assert: type asNullableType = other.
	^ type
]

{ #category : #testing }
TypNilTypeExamples >> hasClassDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasClassDescription.
	^ type
]

{ #category : #testing }
TypNilTypeExamples >> hasSuperType [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasSuperType.
	^ type
]

{ #category : #testing }
TypNilTypeExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil.
	^ type
]

{ #category : #testing }
TypNilTypeExamples >> isNullable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNullable.
	^ type
]

{ #category : #accessing }
TypNilTypeExamples >> printOn [
	<gtExample>
	| type |
	type := self type.
	self assert: type asString = '!'.
	self assert: type asNullableType asString = '!'.
	^ type
]

{ #category : #testing }
TypNilTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self assert: type superType = self typeObject.
	^ type
]

{ #category : #'as yet unclassified' }
TypNilTypeExamples >> type [
	^ TypNilType instance
]
