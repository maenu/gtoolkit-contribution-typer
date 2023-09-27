Class {
	#name : #TypUnknownTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Testing'
}

{ #category : #testing }
TypUnknownTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := TypUnknownTypeInitializingExamples new new.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := TypUnknownTypeInitializingExamples new new.
	self assert: type isNamed.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := TypUnknownTypeInitializingExamples new new.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := TypUnknownTypeInitializingExamples new new.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := TypUnknownTypeInitializingExamples new new.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := TypUnknownTypeInitializingExamples new new.
	self assert: type isUnknown.
	^ type
]

{ #category : #testing }
TypUnknownTypeTestingExamples >> isVariable [
	<gtExample>
	| type |
	type := TypUnknownTypeInitializingExamples new new.
	self assert: type isVariable not.
	^ type
]
