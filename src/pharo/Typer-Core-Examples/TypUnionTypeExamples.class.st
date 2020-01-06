Class {
	#name : #TypUnionTypeExamples,
	#superclass : #TypTypeExamples,
	#category : #'Typer-Core-Examples-OLD-Type'
}

{ #category : #converting }
TypUnionTypeExamples >> asTypeCompatibleWith [
	<gtExample>
	| type |
	type := self type.
	self
		assert:
			(type asCompatibleWith: TypUnknownType instance)
				= TypUnknownType instance.
	self
		assert: (type asCompatibleWith: TypNilType instance) = type asNullableType.
	self
		assert: (type asCompatibleWith: TypNilType instance) = self typeWithNil.
	self
		assert: (type asCompatibleWith: self typeInteger) = self typeInteger.
	self
		assert:
			(type asCompatibleWith: self typeProtoObject)
				= self typeProtoObject.
	self
		assert:
			(type asCompatibleWith: self typeNotAClass)
				= TypUnknownType instance.
	^ type
]

{ #category : #testing }
TypUnionTypeExamples >> hasSuperType [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasSuperType.
	self assert: self typeWithNil hasSuperType.
	self assert: self typeWithUnknown hasSuperType.
	self assert: self typeWithUnknownAndNil hasSuperType.
	self assert: self typeSmallIntegerAndTrue hasSuperType.
	self assert: self typeWithNil superType hasSuperType.
	self assert: self typeWithUnknown superType hasSuperType.
	self assert: self typeWithUnknownAndNil superType hasSuperType.
	^ type
]

{ #category : #testing }
TypUnionTypeExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion.
	^ type
]

{ #category : #accessing }
TypUnionTypeExamples >> printOn [
	<gtExample>
	| type |
	type := self type.
	self assert: type asString = '{Integer}'.
	self assert: self typeWithNil asString = '{!,Integer}'.
	self assert: self typeWithUnknown asString = '{?,Integer}'.
	self assert: self typeWithUnknownAndNil asString = '{!,?,Integer}'.
	^ type
]

{ #category : #testing }
TypUnionTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self assert: type superType = self typeInteger.
	self
		assert:
			self typeWithNil superType
				=
					{self typeInteger.
					TypNilType instance} typAsType.
	self
		assert:
			self typeWithUnknown superType
				=
					{self typeInteger.
					TypUnknownType instance} typAsType.
	self
		assert:
			self typeWithUnknownAndNil superType
				=
					{self typeInteger.
					TypUnknownType instance.
					TypNilType instance} typAsType.
	self assert: self typeSmallIntegerAndTrue superType = self typeObject.
	self
		assert:
			self typeWithNil superType superType
				=
					{Number typAsType.
					TypNilType instance} typAsType.
	self
		assert:
			self typeWithUnknown superType superType
				=
					{Number typAsType.
					TypUnknownType instance} typAsType.
	self
		assert:
			self typeWithUnknownAndNil superType superType
				=
					{Number typAsType.
					TypUnknownType instance.
					TypNilType instance} typAsType.
	^ type
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> type [
	^ self typeLargePositiveIntegerAndSmallInteger
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeLargePositiveInteger [
	^ TypNamedType named: 'LargePositiveInteger'
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeLargePositiveIntegerAndSmallInteger [
	^ TypUnionType
		types:
			{self typeLargePositiveInteger.
			self typeSmallInteger}
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeSmallInteger [
	^ TypNamedType named: 'SmallInteger'
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeSmallIntegerAndTrue [
	^ TypUnionType
		types:
			{self typeSmallInteger.
			self typeTrue}
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeTrue [
	^ TypNamedType named: 'True'
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeWithNil [
	^ TypUnionType
		types:
			{TypNilType instance.
			self typeLargePositiveInteger.
			self typeSmallInteger}
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeWithUnknown [
	^ TypUnionType
		types:
			{TypUnknownType instance.
			self typeLargePositiveInteger.
			self typeSmallInteger}
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeWithUnknownAndNil [
	^ TypUnionType
		types:
			{TypNilType instance.
			TypUnknownType instance.
			self typeLargePositiveInteger.
			self typeSmallInteger}
]
