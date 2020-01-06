Class {
	#name : #TypUnionTypeTestingExamples,
	#superclass : #TypTypeTestingExamples,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypUnionTypeTestingExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion.
	^ type
]

{ #category : #generated }
TypUnionTypeTestingExamples >> type [
	^ TypUnionType
		types:
			{LargePositiveInteger typAsType.
			SmallInteger typAsType}
]
