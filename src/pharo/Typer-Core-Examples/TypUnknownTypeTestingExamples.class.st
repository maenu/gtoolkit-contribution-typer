Class {
	#name : #TypUnknownTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypUnknownTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed not.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isTypeVariable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isTypeVariable not.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isVoidType [
	<gtExample>
	| type |
	type := self type.
	self assert: type isVoidType not.
	^ type
]

{ #category : #generated }
TypUnknownTypeTestingExamples >> type [
	<gtExample>
	^ TypUnknownType instance
]
