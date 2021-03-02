Class {
	#name : #TypUnionTypeComparingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Comparing'
}

{ #category : #accessing }
TypUnionTypeComparingExamples >> equality [
	<gtExample>
	| type copy other |
	type := TypUnionTypeInitializingExamples new typesMany.
	copy := type copy.
	other := TypNamedTypeInitializingExamples new classDescription.
	self assert: type = type.
	self assert: type = copy.
	self assert: type hash = type hash.
	self assert: type hash = copy hash.
	self assert: type ~= other.
	self assert: type hash ~= other hash.
	^ type
]

{ #category : #accessing }
TypUnionTypeComparingExamples >> monotony [
	<gtExample>
	| type copy superType |
	type := {(TypNamedType classDescription: String).
	(TypNamedType classDescription: Integer)} typAsType.
	copy := type copy.
	superType := type superType.
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
