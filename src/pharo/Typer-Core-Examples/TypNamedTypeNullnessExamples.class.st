Class {
	#name : #TypNamedTypeNullnessExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Nullness'
}

{ #category : #accessing }
TypNamedTypeNullnessExamples >> asNonNullable [
	<gtExample>
	| type nonNullable |
	type := TypNamedTypeInitializingExamples new classDescription.
	nonNullable := type asNonNullable.
	self assert: nonNullable == type.
	^ nonNullable
]

{ #category : #accessing }
TypNamedTypeNullnessExamples >> asNullable [
	<gtExample>
	| type nullable |
	type := TypNamedTypeInitializingExamples new classDescription.
	nullable := type asNullable.
	self
		assert:
			nullable
				=
					(TypUnionType
						types:
							{TypNilType new.
							type}).
	^ nullable
]

{ #category : #accessing }
TypNamedTypeNullnessExamples >> isNullable [
	<gtExample>
	| type nullable |
	type := TypNamedTypeInitializingExamples new classDescription.
	nullable := type asNullable.
	self assert: type isNullable not.
	self assert: nullable isNullable.
	^ nullable
]
