Class {
	#name : #TypUnionTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #accessing }
TypUnionTypeInitializingExamples >> asTypesFlattensUnionTypes [
	<gtExample>
	self
		assert:
			(TypUnionType
				asTypes:
					{(TypNamedType classDescription: ProtoObject).
					(TypUnionType
						types:
							{TypNilType new.
							TypUnknownType new})})
		equals:
			{(TypNamedType classDescription: ProtoObject).
			TypNilType new.
			TypUnknownType new} asSet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> asTypesKeepsNilType [
	<gtExample>
	self
		assert:
			(TypUnionType
				asTypes:
					{(TypNamedType classDescription: ProtoObject).
					TypNilType new})
		equals:
			{(TypNamedType classDescription: ProtoObject).
			TypNilType new} asSet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> asTypesKeepsUnknownType [
	<gtExample>
	self
		assert:
			(TypUnionType
				asTypes:
					{(TypNamedType classDescription: ProtoObject).
					TypUnknownType new})
		equals:
			{(TypNamedType classDescription: ProtoObject).
			TypUnknownType new} asSet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> asTypesRemovesDuplicates [
	<gtExample>
	self
		assert:
			(TypUnionType
				asTypes:
					{TypUnknownType new.
					TypUnknownType new})
		equals: {TypUnknownType new} asSet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> asTypesRemovesSubTypes [
	<gtExample>
	self
		assert:
			(TypUnionType
				asTypes:
					{TypNamedType classDescription: Integer.
					TypNamedType classDescription: Number})
		equals: {TypNamedType classDescription: Number} asSet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typesEmpty [
	<gtExample>
	self assert: [ TypUnionType types: {} ] signals: AssertionFailure.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typesMany [
	<gtExample>
	| type |
	type := TypUnionType
		types:
			{TypUnknownType new.
			TypNilType new}.
	self
		assert: type types
		equals:
			{TypUnknownType new.
			TypNilType new} asSet.
	^ type
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typesNonNormalized [
	<gtExample>
	self
		assert: [ TypUnionType
				types:
					{TypUnknownType new.
					TypUnknownType new} ]
		signals: AssertionFailure.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typesOne [
	<gtExample>
	self
		assert: [ TypUnionType types: {TypUnknownType new} ]
		signals: AssertionFailure.
	^ nil
]
