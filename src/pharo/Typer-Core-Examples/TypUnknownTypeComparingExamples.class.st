Class {
	#name : #TypUnknownTypeComparingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Comparing'
}

{ #category : #accessing }
TypUnknownTypeComparingExamples >> equality [
	<gtExample>
	| type other |
	type := TypUnknownTypeInitializingExamples new new.
	other := TypNamedTypeInitializingExamples new classDescription.
	self assert: type = type.
	self assert: type hash = type hash.
	self assert: type ~= other.
	self assert: type hash ~= other hash.
	^ type
]

{ #category : #accessing }
TypUnknownTypeComparingExamples >> monotony [
	<gtExample>
	| type other |
	type := TypUnknownTypeInitializingExamples new new.
	other := TypNamedTypeInitializingExamples new classDescription.
	self assert: (type > type) not.
	self assert: type > other.
	self assert: (other > type) not.
	self assert: type >= type.
	self assert: type >= other.
	self assert: (other >= type) not.
	self assert: type <= type.
	self assert: (type <= other) not.
	self assert: other <= type.
	self assert: (type < type) not.
	self assert: (type < other) not.
	self assert: other < type.
	^ type
]
