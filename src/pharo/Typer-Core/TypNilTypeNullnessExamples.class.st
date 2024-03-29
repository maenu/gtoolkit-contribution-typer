Class {
	#name : #TypNilTypeNullnessExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Nullness'
}

{ #category : #accessing }
TypNilTypeNullnessExamples >> asNonNullable [

	<gtExample>
	| type nonNullable |
	type := TypNilTypeInitializingExamples new new.
	nonNullable := type asNonNullable.
	self assert: nonNullable = TypUnknownType instance.
	^ nonNullable
]

{ #category : #accessing }
TypNilTypeNullnessExamples >> asNullable [
	<gtExample>
	| type nullable |
	type := TypNilTypeInitializingExamples new new.
	nullable := type asNullable.
	self assert: nullable == type.
	^ nullable
]

{ #category : #accessing }
TypNilTypeNullnessExamples >> isNullable [
	<gtExample>
	| type nonNullable |
	type := TypNilTypeInitializingExamples new new.
	nonNullable := type asNonNullable.
	self assert: type isNullable.
	self assert: nonNullable isNullable not.
	^ nonNullable
]
