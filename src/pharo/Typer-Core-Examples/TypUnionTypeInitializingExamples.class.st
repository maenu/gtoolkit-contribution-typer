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
				TypNilType instance } typAsType
		equals: (TypUnionType types: { 
					 (TypNamedType classDescription: Integer).
					 (TypNamedType classDescription: Number).
					 TypNilType instance } asSet).
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsTypeKeepsNilType [

	<gtExample>
	self
		assert: { 
				(TypNamedType classDescription: Integer).
				TypNilType instance } typAsType
		equals: (TypUnionType types: { 
					 (TypNamedType classDescription: Integer).
					 TypNilType instance } asSet).
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
				TypUnknownType instance } typAsType
		equals: (TypUnionType types: { 
					 (TypNamedType classDescription: Integer).
					 TypUnknownType instance } asSet).
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
	type := TypUnionType types: { 
			        TypUnknownType instance.
			        TypNilType instance } asSet.
	self assert: type types equals: { 
			TypUnknownType instance.
			TypNilType instance } asSet.
	^ type
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typesNonNormalized [

	<gtExample>
	self
		assert: [ 
			TypUnionType types: { 
					TypUnknownType instance.
					TypUnknownType instance } ]
		signals: AssertionFailure.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typesOne [

	<gtExample>
	self
		assert: [ TypUnionType types: { TypUnknownType instance } ]
		signals: AssertionFailure.
	^ nil
]
