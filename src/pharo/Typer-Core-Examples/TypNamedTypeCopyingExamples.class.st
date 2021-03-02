Class {
	#name : #TypNamedTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Copying'
}

{ #category : #accessing }
TypNamedTypeCopyingExamples >> copyIsShallow [
	<gtExample>
	| original copy |
	original := TypNamedTypeInitializingExamples new classDescription.
	"ensure superType"
	original superType.
	copy := original copy.
	self assert: original ~~ copy.
	self assert: original superType isNotNil.
	self assert: original superType == copy superType.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	^ copy
]
