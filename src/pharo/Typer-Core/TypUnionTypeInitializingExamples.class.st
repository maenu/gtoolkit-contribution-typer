Class {
	#name : #TypUnionTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Initializing'
}

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsMinimizedTypeDoesNotReduceNilAndVoidAndUnknown [
	<gtExample>
	self
		assert: {TypVoidType instance.
				TypNilType instance.
				TypUnknownType instance} typAsMinimizedType types
		equals: {TypVoidType instance.
				TypNilType instance.
				TypUnknownType instance} asIdentitySet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsMinimizedTypeDoesNotReduceNonCovariantTypes [
	<gtExample>
	self
		assert: {TypNamedType classDescription: Integer.
				TypNamedType classDescription: Number.
				TypNamedType classDescription: Boolean} typAsMinimizedType types
		equals: {TypNamedType classDescription: Number.
				TypNamedType classDescription: Boolean} asIdentitySet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsMinimizedTypeDoesNotReduceUnknownAndNonProtoObject [
	<gtExample>
	self
		assert: {TypNamedType classDescription: Object.
				TypUnknownType instance} typAsMinimizedType types
		equals: {TypNamedType classDescription: Object.
				TypUnknownType instance} asIdentitySet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsMinimizedTypeReducesCovariantTypes [
	<gtExample>
	self
		assert: {TypNamedType classDescription: Integer.
				TypNamedType classDescription: Number} typAsMinimizedType types
		equals: {TypNamedType classDescription: Number} asIdentitySet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsMinimizedTypeReducesNilAndObject [
	<gtExample>
	self
		assert: {TypNamedType classDescription: Object.
				TypNilType instance} typAsMinimizedType types
		equals: {TypNamedType classDescription: Object} asIdentitySet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsMinimizedTypeReducesUnknownAndProtoObject [
	<gtExample>
	self
		assert: {TypNamedType classDescription: ProtoObject.
				TypUnknownType instance} typAsMinimizedType types
		equals: {TypUnknownType instance} asIdentitySet.
	^ nil
]

{ #category : #accessing }
TypUnionTypeInitializingExamples >> typAsTypeFlattensUnionTypes [

	<gtExample>
	self
		assert: { 
				(TypUnionType types: { 
						 (TypNamedType classDescription: Integer).
						 (TypNamedType classDescription: Number) } asIdentitySet).
				(TypNamedType classDescription: Integer).
				TypNilType instance } typAsType
		equals: (TypUnionType types: { 
					 (TypNamedType classDescription: Integer).
					 (TypNamedType classDescription: Number).
					 TypNilType instance } asIdentitySet).
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
					 TypNilType instance } asIdentitySet).
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
					 TypUnknownType instance } asIdentitySet).
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
			        TypNilType instance } asIdentitySet.
	self assert: type types equals: { 
			TypUnknownType instance.
			TypNilType instance } asIdentitySet.
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
