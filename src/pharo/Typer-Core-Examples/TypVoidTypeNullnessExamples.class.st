Class {
	#name : #TypVoidTypeNullnessExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Nullness'
}

{ #category : #accessing }
TypVoidTypeNullnessExamples >> asNonNullable [
	<gtExample>
	| type nonNullable |
	type := TypVoidTypeInitializingExamples new typeInstance.
	nonNullable := type asNonNullable.
	self assert: nonNullable == type.
	^ nonNullable
]

{ #category : #accessing }
TypVoidTypeNullnessExamples >> asNullable [
	<gtExample>
	| type nullable |
	type := TypVoidTypeInitializingExamples new typeInstance.
	nullable := type asNullable.
	self assert: nullable == TypNilType instance.
	^ nullable
]

{ #category : #accessing }
TypVoidTypeNullnessExamples >> isNullable [
	<gtExample>
	| type nullable |
	type := TypVoidTypeInitializingExamples new typeInstance.
	nullable := type asNullable.
	self assert: type isNullable not.
	self assert: nullable isNullable.
	^ nullable
]
