Class {
	#name : #TypFunctionTypeNullnessExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Nullness'
}

{ #category : #accessing }
TypFunctionTypeNullnessExamples >> asNonNullable [
	<gtExample>
	| type nonNullable |
	type := TypFunctionTypeInitializingExamples new typeClassDescriptionArgumentsSize.
	nonNullable := type asNonNullable.
	self assert: nonNullable == type.
	^ nonNullable
]

{ #category : #accessing }
TypFunctionTypeNullnessExamples >> asNullable [
	<gtExample>
	| type nullable |
	type := TypFunctionTypeInitializingExamples new
		typeClassDescriptionArgumentsSize.
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
TypFunctionTypeNullnessExamples >> isNullable [
	<gtExample>
	| type nullable |
	type := TypFunctionTypeInitializingExamples new typeClassDescriptionArgumentsSize.
	nullable := type asNullable.
	self assert: type isNullable not.
	self assert: nullable isNullable.
	^ nullable
]
