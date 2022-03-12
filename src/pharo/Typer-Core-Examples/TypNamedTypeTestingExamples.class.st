Class {
	#name : #TypNamedTypeTestingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Testing'
}

{ #category : #testing }
TypNamedTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := TypNamedTypeInitializingExamples new classDescription.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypNamedTypeTestingExamples >> isNamed [
	<gtExample>
	| type |
	type := TypNamedTypeInitializingExamples new classDescription.
	self assert: type isNamed.
	^ type
]

{ #category : #testing }
TypNamedTypeTestingExamples >> isNil [
	<gtExample>
	| type |
	type := TypNamedTypeInitializingExamples new classDescription.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypNamedTypeTestingExamples >> isParametric [
	<gtExample>
	| type |
	type := TypNamedTypeInitializingExamples new classDescription.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypNamedTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := TypNamedTypeInitializingExamples new classDescription.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypNamedTypeTestingExamples >> isUnknown [
	<gtExample>
	| type |
	type := TypNamedTypeInitializingExamples new classDescription.
	self assert: type isUnknown not.
	^ type
]

{ #category : #testing }
TypNamedTypeTestingExamples >> isVariable [
	<gtExample>
	| type |
	type := TypNamedTypeInitializingExamples new classDescription.
	self assert: type isVariable not.
	^ type
]
