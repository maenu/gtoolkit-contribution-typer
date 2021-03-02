Class {
	#name : #TypVariableTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypVariableTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := TypVariableTypeInitializingExamples new named.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypVariableTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := TypVariableTypeInitializingExamples new named.
	self assert: type isNamed not.
	^ type
]

{ #category : #testing }
TypVariableTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := TypVariableTypeInitializingExamples new named.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypVariableTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := TypVariableTypeInitializingExamples new named.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypVariableTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := TypVariableTypeInitializingExamples new named.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypVariableTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := TypVariableTypeInitializingExamples new named.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypVariableTypeTestingExamples >> isVariable [
	<gtExample>
	| type |
	type := TypVariableTypeInitializingExamples new named.
	self assert: type isVariable.
	^ type
]
