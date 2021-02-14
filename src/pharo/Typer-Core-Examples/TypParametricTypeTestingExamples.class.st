Class {
	#name : #TypParametricTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypParametricTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isVariable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isVariable not.
	^ type
]

{ #category : #accessing }
TypParametricTypeTestingExamples >> type [
	<gtExample>
	^ TypParametricType
		named: 'OrderedCollection'
		parameters: {('@A' -> Integer typAsType)} asOrderedDictionary
]
