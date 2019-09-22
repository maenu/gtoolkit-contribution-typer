Class {
	#name : #TypTypeExamples,
	#superclass : #TypExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #converting }
TypTypeExamples >> asFunctionTypeResultOptionalParameters [
	<gtExample>
	| type |
	type := self type.
	self
		assert: [ type asFunctionType: nil result: nil optionalParameters: nil ]
		signals: TypNoTypeError.
	^ type
]

{ #category : #converting }
TypTypeExamples >> asNamedType [
	<gtExample>
	| type |
	type := self type.
	self assert: [ type asNamedType ] signals: TypNoTypeError.
	^ type
]

{ #category : #converting }
TypTypeExamples >> asNonNullableType [ 
	<gtExample>
	| type nonNullableType |
	type := self type.
	nonNullableType := type asNonNullableType.
	self assert: nonNullableType nullable not.
	self assert: nonNullableType == type.
	^ nonNullableType
]

{ #category : #converting }
TypTypeExamples >> asNullableType [
	<gtExample>
	| type nullableType |
	type := self type.
	nullableType := type asNullableType.
	self assert: nullableType nullable.
	self assert: nullableType ~~ type.
	self assert: nullableType <= type.
	self assert: nullableType asNonNullableType = type.
	^ nullableType
]

{ #category : #converting }
TypTypeExamples >> asParametricType [
	<gtExample>
	| type |
	type := self type.
	self assert: [ type asParametricType: nil ] signals: TypNoTypeError.
	^ type
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> asTypeCompatibleWith [
	<gtExample>
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> canUnderstand [
	<gtExample>
	| type |
	type := self type.
	self assert: (type canUnderstand: nil) not.
	^ type
]

{ #category : #converting }
TypTypeExamples >> classDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: [ type classDescription ] signals: TypNoClassDescriptionError.
	^ type
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> equality [
	<gtExample>
	| type other |
	type := self type.
	other := self type.
	self assert: type ~~ other.
	self assert: type hash = other hash.
	self assert: type = other.
	self assert: type asNullableType hash ~= other hash.
	self assert: type asNullableType ~= other.
	^ type
]

{ #category : #testing }
TypTypeExamples >> hasSuperType [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasSuperType not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown not.
	^ type
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> lookupSelector [
	<gtExample>
	| type |
	type := self type.
	self assert: (type lookupSelector: nil) isEmpty.
	^ type
]

{ #category : #accessing }
TypTypeExamples >> monotony [
	<gtExample>
	| type superType |
	type := self type.
	superType := type superType.
	self assert: superType > type.
	self assert: superType >= type.
	self assert: type >= type.
	self assert: type <= type.
	self assert: type <= superType.
	self assert: type < superType.
	^ type
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> printOn [
	<gtExample>
	self subclassResponsibility
]

{ #category : #testing }
TypTypeExamples >> representsClassDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type representsClassDescription not.
	^ type
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self assert: [ type superType ] signals: TypNoTypeError.
	^ type
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> type [
	<gtExample>
	self subclassResponsibility
]
