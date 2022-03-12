Class {
	#name : #TypFunctionTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Testing'
}

{ #category : #testing }
TypFunctionTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new
		classDescriptionArgumentsSizeArgumentsOptionalBindings.
	self assert: type isFunction.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new
		classDescriptionArgumentsSizeArgumentsOptionalBindings.
	self assert: type isNamed.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new
		classDescriptionArgumentsSizeArgumentsOptionalBindings.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new
		classDescriptionArgumentsSizeArgumentsOptionalBindings.
	self assert: type isParametric.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new
		classDescriptionArgumentsSizeArgumentsOptionalBindings.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new
		classDescriptionArgumentsSizeArgumentsOptionalBindings.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypFunctionTypeTestingExamples >> isVariable [
	<gtExample>
	| type |
	type := TypFunctionTypeInitializingExamples new
		classDescriptionArgumentsSizeArgumentsOptionalBindings.
	self assert: type isVariable not.
	^ type
]
