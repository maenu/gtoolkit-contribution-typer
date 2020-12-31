Class {
	#name : #TypTypeVariableTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypTypeVariableTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypTypeVariableTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed not.
	^ type
]

{ #category : #testing }
TypTypeVariableTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypTypeVariableTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypTypeVariableTypeTestingExamples >> isTypeVariable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isTypeVariable.
	^ type
]

{ #category : #testing }
TypTypeVariableTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypTypeVariableTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypTypeVariableTypeTestingExamples >> isVoidType [
	<gtExample>
	| type |
	type := self type.
	self assert: type isVoidType not.
	^ type
]

{ #category : #generated }
TypTypeVariableTypeTestingExamples >> type [
	<gtExample>
	^ TypTypeVariableType named: '@A'
]
