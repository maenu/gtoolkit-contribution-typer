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
							{TypNilType instance.
							TypUnknownType instance})})
		equals:
			{(TypNamedType classDescription: ProtoObject).
			TypNilType instance.
			TypUnknownType instance} asSet.
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
					TypNilType instance})
		equals:
			{(TypNamedType classDescription: ProtoObject).
			TypNilType instance} asSet.
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
					TypUnknownType instance})
		equals:
			{(TypNamedType classDescription: ProtoObject).
			TypUnknownType instance} asSet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> asTypesRemovesDuplicates [
	<gtExample>
	self
		assert:
			(TypUnionType
				asTypes:
					{TypUnknownType instance.
					TypUnknownType instance})
		equals: {TypUnknownType instance} asSet.
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
			{TypUnknownType instance.
			TypNilType instance}.
	self
		assert: type types
		equals:
			{TypUnknownType instance.
			TypNilType instance} asSet.
	^ type
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typesNonNormalized [
	<gtExample>
	self
		assert: [ TypUnionType
				types:
					{TypUnknownType instance.
					TypUnknownType instance} ]
		signals: AssertionFailure.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typesOne [
	<gtExample>
	self
		assert: [ TypUnionType types: {TypUnknownType instance} ]
		signals: AssertionFailure.
	^ nil
]
