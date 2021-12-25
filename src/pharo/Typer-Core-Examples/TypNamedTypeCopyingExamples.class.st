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
	original super.
	copy := original copy.
	self assert: original ~~ copy.
	self assert: original super isNotNil.
	self assert: original super == copy super.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	^ copy
]
