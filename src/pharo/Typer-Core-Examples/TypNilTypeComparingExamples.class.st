Class {
	#name : #TypNilTypeComparingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Comparing'
}

{ #category : #accessing }
TypNilTypeComparingExamples >> equality [
	<gtExample>
	| type superType |
	type := TypNilTypeInitializingExamples new typeInstance.
	superType := type superType.
	self assert: type = type.
	self assert: type hash = type hash.
	self assert: type ~= superType.
	self assert: type hash ~= superType hash.
	^ type
]

{ #category : #accessing }
TypNilTypeComparingExamples >> monotony [
	<gtExample>
	| type superType |
	type := TypNilTypeInitializingExamples new typeInstance.
	superType := type superType.
	self assert: (type > type) not.
	self assert: (type > superType) not.
	self assert: superType > type.
	self assert: type >= type.
	self assert: (type >= superType) not.
	self assert: superType >= type.
	self assert: type <= type.
	self assert: type <= superType.
	self assert: (superType <= type) not.
	self assert: (type < type) not.
	self assert: type < superType.
	self assert: (superType < type) not.
	^ type
]
