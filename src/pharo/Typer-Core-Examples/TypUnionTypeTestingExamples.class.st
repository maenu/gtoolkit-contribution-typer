Class {
	#name : #TypUnionTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypUnionTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed not.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isTypeVariable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isTypeVariable not.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isVoidType [
	<gtExample>
	| type |
	type := self type.
	self assert: type isVoidType not.
	^ type
]

{ #category : #generated }
TypUnionTypeTestingExamples >> type [
	<gtExample>
	^ TypUnionType
		types:
			{LargePositiveInteger typAsType.
			SmallInteger typAsType}
]
