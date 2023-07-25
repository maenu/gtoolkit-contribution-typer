Class {
	#name : #TypVariableTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Copying'
}

{ #category : #accessing }
TypVariableTypeCopyingExamples >> copyIsShallow [

	<gtExample>
	| original copy |
	original := TypVariableTypeInitializingExamples new named 
		            withSuper:
		            TypNamedTypeInitializingExamples new classDescription.
	copy := original copy.
	self assert: original ~~ copy.
	self assert: original super isNotNil.
	self assert: original super == copy super.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	^ copy
]
