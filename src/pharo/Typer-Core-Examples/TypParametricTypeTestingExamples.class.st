Class {
	#name : #TypParametricTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Testing'
}

{ #category : #testing }
TypParametricTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := TypParametricTypeInitializingExamples new
		classDescriptionParameters.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := TypParametricTypeInitializingExamples new
		classDescriptionParameters.
	self assert: type isNamed.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := TypParametricTypeInitializingExamples new
		classDescriptionParameters.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := TypParametricTypeInitializingExamples new
		classDescriptionParameters.
	self assert: type isParametric.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := TypParametricTypeInitializingExamples new
		classDescriptionParameters.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := TypParametricTypeInitializingExamples new
		classDescriptionParameters.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypParametricTypeTestingExamples >> isVariable [
	<gtExample>
	| type |
	type := TypParametricTypeInitializingExamples new
		classDescriptionParameters.
	self assert: type isVariable not.
	^ type
]
