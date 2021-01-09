Class {
	#name : #TypParametricTypeNullnessExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Nullness'
}

{ #category : #accessing }
TypParametricTypeNullnessExamples >> asNonNullable [
	<gtExample>
	| type nonNullable |
	type := TypParametricTypeInitializingExamples
		typGtExampleValue: #typeClassDescriptionParameters.
	nonNullable := type asNonNullable.
	self assert: nonNullable == type.
	^ nonNullable
]

{ #category : #accessing }
TypParametricTypeNullnessExamples >> asNullable [
	<gtExample>
	| type nullable |
	type := TypParametricTypeInitializingExamples
		typGtExampleValue: #typeClassDescriptionParameters.
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
TypParametricTypeNullnessExamples >> isNullable [
	<gtExample>
	| type nullable |
	type := TypParametricTypeInitializingExamples
		typGtExampleValue: #typeClassDescriptionParameters.
	nullable := type asNullable.
	self assert: type isNullable not.
	self assert: nullable isNullable.
	^ nullable
]
