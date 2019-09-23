Class {
	#name : #TypUnknownTypeExamples,
	#superclass : #TypTypeExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #'as yet unclassified' }
TypUnknownTypeExamples >> asTypeCompatibleWith [
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
		assert:
			(type asTypeCompatibleWith: self typeInteger)
				= TypUnknownType instance.
	self
		assert:
			(type asTypeCompatibleWith: self typeProtoObject)
				= TypUnknownType instance.
	self
		assert:
			(type asTypeCompatibleWith: self typeNotAClass)
				= TypUnknownType instance.
	^ type
]

{ #category : #'as yet unclassified' }
TypUnknownTypeExamples >> copy_ [
	<gtExample>
	| type |
	type := self type.
	self assert: type copy == type.
	^ type
]

{ #category : #accessing }
TypUnknownTypeExamples >> equality [
	<gtExample>
	| type other |
	type := self type.
	other := self type.
	self assert: type == other.
	self assert: type hash = other hash.
	self assert: type = other.
	self assert: type asNullableType hash ~= other hash.
	self assert: type asNullableType ~= other.
	^ type
]

{ #category : #testing }
TypUnknownTypeExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown.
	^ type
]

{ #category : #accessing }
TypUnknownTypeExamples >> monotony [
	<gtExample>
	| type |
	type := self type.
	self assert: (type > type) not.
	self assert: type >= type.
	self assert: type <= type.
	self assert: (type < type) not.
	^ type
]

{ #category : #'as yet unclassified' }
TypUnknownTypeExamples >> printOn [
	<gtExample>
	| type |
	type := self type.
	self assert: type asString = '?'.
	self assert: type asNullableType asString = '{!?}'.
	^ type
]

{ #category : #'as yet unclassified' }
TypUnknownTypeExamples >> type [
	<gtExample>
	^ TypUnknownType instance
]
