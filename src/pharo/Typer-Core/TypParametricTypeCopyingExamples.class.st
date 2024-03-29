Class {
	#name : #TypParametricTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Copying'
}

{ #category : #accessing }
TypParametricTypeCopyingExamples >> copyIsNearlyShallow [
	<gtExample>
	| original copy |
	original := TypParametricTypeInitializingExamples new
			classDescriptionParameters copy.
	original parameters
		at: original parameters keys first
		put: TypNamedTypeInitializingExamples new classDescription.	"ensure superType"
	original super.
	copy := original copy.
	self assert: original ~~ copy.
	self assert: original super isNotNil.
	self assert: original super == copy super.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	self assert: original parameters isNotNil.
	self assert: original parameters ~~ copy parameters.
	self assert: original parameters = copy parameters.
	^ copy
]

{ #category : #accessing }
TypParametricTypeCopyingExamples >> copyWithParameters [
	<gtExample>
	| original copy |
	original := TypParametricTypeInitializingExamples new classDescriptionParameters.
	"ensure superType"
	original super.
	copy := original
		withParameters:
			{TypNamedTypeInitializingExamples new namedWithoutClassDescription}.
	self assert: original ~~ copy.
	self assert: original super isNotNil.
	self assert: original super = copy super.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	self assert: original parameters isNotNil.
	self assert: original parameters ~~ copy parameters.
	self assert: original parameters keys = copy parameters keys.
	self
		assert: (copy at: #A)
		equals:
			TypNamedTypeInitializingExamples new namedWithoutClassDescription.
	^ copy
]
