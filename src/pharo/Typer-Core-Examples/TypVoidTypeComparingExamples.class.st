Class {
	#name : #TypVoidTypeComparingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Comparing'
}

{ #category : #accessing }
TypVoidTypeComparingExamples >> equality [
	<gtExample>
	| type other |
	type := TypVoidTypeInitializingExamples
		typGtExampleValue: #typeInstance.
	other := TypNamedTypeInitializingExamples
		typGtExampleValue: #typeClassDescription.
	self assert: type = type.
	self assert: type hash = type hash.
	self assert: type ~= other.
	self assert: type hash ~= other hash.
	^ type
]

{ #category : #accessing }
TypVoidTypeComparingExamples >> monotony [
	<gtExample>
	| type other |
	type := TypVoidTypeInitializingExamples
		typGtExampleValue: #typeInstance.
	other := TypNamedTypeInitializingExamples
		typGtExampleValue: #typeClassDescription.
	self assert: (type > type) not.
	self assert: (type > other) not.
	self assert: (other > type) not.
	self assert: type >= type.
	self assert: (type >= other) not.
	self assert: (other >= type) not.
	self assert: type <= type.
	self assert: (type <= other) not.
	self assert: (other <= type) not.
	self assert: (type < type) not.
	self assert: (type < other) not.
	self assert: (other < type) not.
	^ type
]
