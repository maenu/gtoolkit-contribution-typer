Class {
	#name : #TypUnionTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Copying'
}

{ #category : #accessing }
TypUnionTypeCopyingExamples >> copyIsNearlyShallow [
	<gtExample>
	| original copy |
	original := TypUnionTypeInitializingExamples
		typGtExampleValue: #typesMany.
	copy := original copy.
	self assert: original ~~ copy.
	self assert: original hasSuperType not.
	self assert: copy hasSuperType not.
	self assert: original types isNotNil.
	self assert: original types ~~ copy types.
	self assert: original types = copy types.
	^ copy
]
