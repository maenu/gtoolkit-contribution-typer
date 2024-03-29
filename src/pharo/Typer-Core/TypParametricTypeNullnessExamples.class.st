Class {
	#name : #TypParametricTypeNullnessExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Nullness'
}

{ #category : #accessing }
TypParametricTypeNullnessExamples >> asNonNullable [
	<gtExample>
	| type nonNullable |
	type := TypParametricTypeInitializingExamples new classDescriptionParameters.
	nonNullable := type asNonNullable.
	self assert: nonNullable == type.
	^ nonNullable
]

{ #category : #accessing }
TypParametricTypeNullnessExamples >> asNullable [

	<gtExample>
	| type nullable |
	type := TypParametricTypeInitializingExamples new
		        classDescriptionParameters.
	nullable := type asNullable.
	self assert: nullable = (TypUnionType types: { 
				 TypNilType instance.
				 type } asIdentitySet).
	^ nullable
]

{ #category : #accessing }
TypParametricTypeNullnessExamples >> isNullable [
	<gtExample>
	| type nullable |
	type := TypParametricTypeInitializingExamples new classDescriptionParameters.
	nullable := type asNullable.
	self assert: type isNullable not.
	self assert: nullable isNullable.
	^ nullable
]
