Class {
	#name : #TypNilTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypNilTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isTypeVariable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isTypeVariable not.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isVoidType [
	<gtExample>
	| type |
	type := self type.
	self assert: type isVoidType not.
	^ type
]

{ #category : #generated }
TypNilTypeTestingExamples >> type [
	<gtExample>
	^ TypNilType instance
]
