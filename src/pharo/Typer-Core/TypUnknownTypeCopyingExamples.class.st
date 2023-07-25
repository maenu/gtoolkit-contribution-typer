Class {
	#name : #TypUnknownTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Copying'
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
