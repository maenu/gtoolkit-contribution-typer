Class {
	#name : #TypTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #testing }
TypTypeTestingExamples class >> isAbstract [
	^ self = TypTypeTestingExamples
]

{ #category : #testing }
TypTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed not.
	^ type
]

{ #category : #testing }
TypTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypTypeTestingExamples >> isNoType [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNoType not.
	^ type
]

{ #category : #testing }
TypTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypTypeTestingExamples >> isTypeVariable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isTypeVariable not.
	^ type
]

{ #category : #testing }
TypTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown not.
	^ type
]

{ #category : #generated }
TypTypeTestingExamples >> type [
	self subclassResponsibility
]
