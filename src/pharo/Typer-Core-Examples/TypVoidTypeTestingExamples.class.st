Class {
	#name : #TypVoidTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypVoidTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypVoidTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed not.
	^ type
]

{ #category : #testing }
TypVoidTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypVoidTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypVoidTypeTestingExamples >> isTypeVariable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isTypeVariable not.
	^ type
]

{ #category : #testing }
TypVoidTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypVoidTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypVoidTypeTestingExamples >> isVoidType [
	<gtExample>
	| type |
	type := self type.
	self assert: type isVoidType.
	^ type
]

{ #category : #generated }
TypVoidTypeTestingExamples >> type [
	<gtExample>
	^ TypVoidType instance
]
