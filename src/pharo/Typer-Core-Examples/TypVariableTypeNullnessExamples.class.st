Class {
	#name : #TypVariableTypeNullnessExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Nullness'
}

{ #category : #accessing }
TypVariableTypeNullnessExamples >> asNonNullable [
	<gtExample>
	| type nonNullable |
	type := TypVariableTypeInitializingExamples new named.
	nonNullable := type asNonNullable.
	self assert: nonNullable == type.
	^ nonNullable
]

{ #category : #accessing }
TypVariableTypeNullnessExamples >> asNullable [

	<gtExample>
	| type nullable |
	type := TypVariableTypeInitializingExamples new named.
	nullable := type asNullable.
	self assert: nullable = (TypUnionType types: { 
				 TypNilType instance.
				 type } asIdentitySet).
	^ nullable
]

{ #category : #accessing }
TypVariableTypeNullnessExamples >> isNullable [
	<gtExample>
	| type nullable |
	type := TypVariableTypeInitializingExamples new named.
	nullable := type asNullable.
	self assert: type isNullable not.
	self assert: nullable isNullable.
	^ nullable
]
