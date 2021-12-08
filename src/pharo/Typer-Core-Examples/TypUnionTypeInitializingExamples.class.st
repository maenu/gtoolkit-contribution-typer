Class {
	#name : #TypUnionTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsTypeFlattensUnionTypes [

	<gtExample>
	self
		assert: { 
				(TypUnionType types: { 
						 (TypNamedType classDescription: Integer).
						 (TypNamedType classDescription: Number) } asSet).
				(TypNamedType classDescription: Integer).
				TypNilType new } typAsType
		equals: (TypUnionType types: { 
					 (TypNamedType classDescription: Integer).
					 (TypNamedType classDescription: Number).
					 TypNilType new } asSet).
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsTypeKeepsNilType [

	<gtExample>
	self
		assert: { 
				(TypNamedType classDescription: Integer).
				TypNilType new } typAsType
		equals: (TypUnionType types: { 
					 (TypNamedType classDescription: Integer).
					 TypNilType new } asSet).
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsTypeKeepsSubTypes [

	<gtExample>
	self
		assert: { 
				(TypNamedType classDescription: Integer).
				(TypNamedType classDescription: Number) } typAsType
		equals: (TypUnionType types: { 
					 (TypNamedType classDescription: Integer).
					 (TypNamedType classDescription: Number) } asSet).
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsTypeKeepsUnknownType [

	<gtExample>
	self
		assert: { 
				(TypNamedType classDescription: Integer).
				TypUnknownType new } typAsType
		equals: (TypUnionType types: { 
					 (TypNamedType classDescription: Integer).
					 TypUnknownType new } asSet).
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsTypeRemovesDuplicates [

	<gtExample>
	self
		assert: { 
				(TypNamedType classDescription: Integer).
				(TypNamedType classDescription: Integer) } typAsType
		equals: (TypNamedType classDescription: Integer).
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
			TypNilType new} asSet.
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
