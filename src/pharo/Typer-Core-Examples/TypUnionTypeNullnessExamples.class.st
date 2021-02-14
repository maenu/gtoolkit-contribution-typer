Class {
	#name : #TypUnionTypeNullnessExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Nullness'
}

{ #category : #accessing }
TypUnionTypeNullnessExamples >> asNonNullable [
	<gtExample>
	| type nonNullable |
	type := TypUnionTypeInitializingExamples new typesMany.
	nonNullable := type asNonNullable.
	self assert: nonNullable == TypUnknownType new.
	^ nonNullable
]

{ #category : #accessing }
TypUnionTypeNullnessExamples >> asNullable [
	<gtExample>
	| type nullable |
	type := TypUnionTypeInitializingExamples new typesMany.
	nullable := type asNullable.
	self assert: nullable == type.
	^ nullable
]

{ #category : #accessing }
TypUnionTypeNullnessExamples >> isNullable [
	<gtExample>
	| type nonNullable |
	type := TypUnionTypeInitializingExamples new typesMany.
	nonNullable := type asNonNullable.
	self assert: type isNullable.
	self assert: nonNullable isNullable not.
	^ nonNullable
]
