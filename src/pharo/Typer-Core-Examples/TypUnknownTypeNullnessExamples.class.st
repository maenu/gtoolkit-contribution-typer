Class {
	#name : #TypUnknownTypeNullnessExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Nullness'
}

{ #category : #accessing }
TypUnknownTypeNullnessExamples >> asNonNullable [
	<gtExample>
	| type nonNullable |
	type := TypUnknownTypeInitializingExamples new typeInstance.
	nonNullable := type asNonNullable.
	self assert: nonNullable == type.
	^ nonNullable
]

{ #category : #accessing }
TypUnknownTypeNullnessExamples >> asNullable [
	<gtExample>
	| type nullable |
	type := TypUnknownTypeInitializingExamples new typeInstance.
	nullable := type asNullable.
	self
		assert:
			nullable
				=
					(TypUnionType
						types:
							{TypNilType instance.
							type}).
	^ nullable
]

{ #category : #accessing }
TypUnknownTypeNullnessExamples >> isNullable [
	<gtExample>
	| type nullable |
	type := TypUnknownTypeInitializingExamples new typeInstance.
	nullable := type asNullable.
	self assert: type isNullable not.
	self assert: nullable isNullable.
	^ nullable
]