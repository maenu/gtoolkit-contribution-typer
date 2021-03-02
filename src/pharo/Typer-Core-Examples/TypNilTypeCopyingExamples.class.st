Class {
	#name : #TypNilTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Copying'
}

{ #category : #accessing }
TypNilTypeCopyingExamples >> copyIsSame [
	<gtExample>
	| original copy |
	original := TypNilTypeInitializingExamples new new.
	copy := original copy.
	self assert: original = copy.
	^ copy
]
