Class {
	#name : #TypUnknownTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Copying'
}

{ #category : #accessing }
TypUnknownTypeCopyingExamples >> copyIsSame [
	<gtExample>
	| original copy |
	original := TypUnknownTypeInitializingExamples new new.
	copy := original copy.
	self assert: original = copy.
	^ copy
]
