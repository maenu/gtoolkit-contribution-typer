Class {
	#name : #TypNilTypeExamples,
	#superclass : #TypNamedTypeExamples,
	#category : #'Typer-Core-Examples-OLD-Type'
}

{ #category : #converting }
TypNilTypeExamples >> asNonNullable [
	<gtExample>
	| type nonNullableType |
	type := self type.
	nonNullableType := type asNonNullable.
	self assert: nonNullableType isNullable not.
	self assert: nonNullableType = TypUnknownType instance.
	^ nonNullableType
]

{ #category : #converting }
TypNilTypeExamples >> asNullable [
	<gtExample>
	| type nullableType |
	type := self type.
	nullableType := type asNullable.
	self assert: nullableType isNullable.
	self assert: nullableType == type.
	self assert: nullableType >= type.
	self assert: nullableType asNonNullable = TypUnknownType instance.
	^ nullableType
]

{ #category : #converting }
TypNilTypeExamples >> asTypeCompatibleWith [
	<gtExample>
	| type |
	type := self type.
	self
		assert:
			(type asCompatibleWith: TypUnknownType instance)
				=
					{TypNilType instance.
					TypUnknownType instance} typAsType.
	self assert: (type asCompatibleWith: TypNilType instance) = type.
	self
		assert:
			(type asCompatibleWith: self typeInteger)
				=
					{TypNilType instance.
					self typeInteger} typAsType.
	self
		assert:
			(type asCompatibleWith: self typeProtoObject)
				=
					{TypNilType instance.
					self typeProtoObject} typAsType.
	self
		assert:
			(type asCompatibleWith: self typeNotAClass)
				=
					{TypNilType instance.
					self typeNotAClass} typAsType.
	^ type
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
	self assert: type asNullable hash = other hash.
	self assert: type asNullable = other.
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

{ #category : #accessing }
TypNilTypeExamples >> printOn [
	<gtExample>
	| type |
	type := self type.
	self assert: type asString = '!'.
	self assert: type asNullable asString = '!'.
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
