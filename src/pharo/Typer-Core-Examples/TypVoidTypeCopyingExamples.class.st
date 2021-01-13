Class {
	#name : #TypVoidTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Copying'
}

{ #category : #accessing }
TypVoidTypeCopyingExamples >> copyIsSame [
	<gtExample>
	| original copy |
	original := TypVoidTypeInitializingExamples new typeInstance.
	copy := original copy.
	self assert: original == copy.
	^ copy
]
