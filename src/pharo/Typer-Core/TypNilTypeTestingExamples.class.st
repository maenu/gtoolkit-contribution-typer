Class {
	#name : #TypNilTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Testing'
}

{ #category : #testing }
TypNilTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := TypNilTypeInitializingExamples new new.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := TypNilTypeInitializingExamples new new.
	self assert: type isNamed.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := TypNilTypeInitializingExamples new new.
	self assert: type isNil.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := TypNilTypeInitializingExamples new new.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := TypNilTypeInitializingExamples new new.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := TypNilTypeInitializingExamples new new.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypNilTypeTestingExamples >> isVariable [
	<gtExample>
	| type |
	type := TypNilTypeInitializingExamples new new.
	self assert: type isVariable not.
	^ type
]
