Class {
	#name : #TypUnknownTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Copying'
}

{ #category : #accessing }
TypUnknownTypeCopyingExamples >> copyIsSame [
	<gtExample>
	| original copy |
	original := TypUnknownTypeInitializingExamples
		typGtExampleValue: #typeInstance.
	copy := original copy.
	self assert: original == copy.
	^ copy
]
