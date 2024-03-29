Class {
	#name : #TypParametricTypeComparingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Comparing'
}

{ #category : #accessing }
TypParametricTypeComparingExamples >> equality [
	<gtExample>
	| type copy superType |
	type := TypParametricTypeInitializingExamples new classDescriptionParameters.
	copy := type copy.
	superType := type super.
	self assert: type = type.
	self assert: type = copy.
	self assert: type hash = type hash.
	self assert: type hash = copy hash.
	self assert: type ~= superType.
	self assert: type hash ~= superType hash.
	^ type
]

{ #category : #accessing }
TypParametricTypeComparingExamples >> monotony [
	<gtExample>
	| type copy superType |
	type := TypParametricTypeInitializingExamples new classDescriptionParameters.
	copy := type copy.
	superType := type super.
	self assert: (type > type) not.
	self assert: (type > copy) not.
	self assert: (copy > type) not.
	self assert: (type > superType) not.
	self assert: superType > type.
	self assert: type >= type.
	self assert: type >= copy.
	self assert: copy >= type.
	self assert: (type >= superType) not.
	self assert: superType >= type.
	self assert: type <= type.
	self assert: type <= copy.
	self assert: copy <= type.
	self assert: type <= superType.
	self assert: (superType <= type) not.
	self assert: (type < type) not.
	self assert: (type < copy) not.
	self assert: (copy < type) not.
	self assert: type < superType.
	self assert: (superType < type) not.
	^ type
]
