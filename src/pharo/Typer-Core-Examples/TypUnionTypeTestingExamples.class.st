Class {
	#name : #TypUnionTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypUnionTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := TypUnionTypeInitializingExamples new typesMany.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := TypUnionTypeInitializingExamples new typesMany.
	self assert: type isNamed not.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := TypUnionTypeInitializingExamples new typesMany.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := TypUnionTypeInitializingExamples new typesMany.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := TypUnionTypeInitializingExamples new typesMany.
	self assert: type isUnion.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := TypUnionTypeInitializingExamples new typesMany.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypUnionTypeTestingExamples >> isVariable [
	<gtExample>
	| type |
	type := TypUnionTypeInitializingExamples new typesMany.
	self assert: type isVariable not.
	^ type
]
