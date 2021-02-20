Class {
	#name : #TypFunctionTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypFunctionTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isVariable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isVariable not.
	^ type
]

{ #category : #generated }
TypFunctionTypeTestingExamples >> type [
	<gtExample>
	^ TypFunctionType
		classDescription: BlockClosure
		result: Boolean typAsType
		arguments: {Integer typAsType}
		argumentsOptional: false
		signalsAlways: nil
]
