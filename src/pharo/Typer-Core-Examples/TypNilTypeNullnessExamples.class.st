Class {
	#name : #TypNilTypeNullnessExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Nullness'
}

{ #category : #accessing }
TypNilTypeNullnessExamples >> asNonNullable [
	<gtExample>
	| type nonNullable |
	type := TypNilTypeInitializingExamples new typeInstance.
	nonNullable := type asNonNullable.
	self assert: nonNullable == TypUnknownType new.
	^ nonNullable
]

{ #category : #accessing }
TypNilTypeNullnessExamples >> asNullable [
	<gtExample>
	| type nullable |
	type := TypNilTypeInitializingExamples new typeInstance.
	nullable := type asNullable.
	self assert: nullable == type.
	^ nullable
]

{ #category : #accessing }
TypNilTypeNullnessExamples >> isNullable [
	<gtExample>
	| type nonNullable |
	type := TypNilTypeInitializingExamples new typeInstance.
	nonNullable := type asNonNullable.
	self assert: type isNullable.
	self assert: nonNullable isNullable not.
	^ nonNullable
]
