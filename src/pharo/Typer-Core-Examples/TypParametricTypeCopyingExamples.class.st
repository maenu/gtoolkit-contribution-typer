Class {
	#name : #TypParametricTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Copying'
}

{ #category : #accessing }
TypParametricTypeCopyingExamples >> copyIsNearlyShallow [
	<gtExample>
	| original copy |
	original := TypParametricTypeInitializingExamples new typeClassDescriptionParameters.
	original
		at: original parameters keys first
		put:
			(TypNamedTypeInitializingExamples new typeClassDescription).
	"ensure superType"
	original superType.
	copy := original copy.
	self assert: original ~~ copy.
	self assert: original superType isNotNil.
	self assert: original superType == copy superType.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	self assert: original parameters isNotNil.
	self assert: original parameters ~~ copy parameters.
	self assert: original parameters = copy parameters.
	^ copy
]

{ #category : #accessing }
TypParametricTypeCopyingExamples >> copyWithBindings [
	<gtExample>
	| original copy |
	original := self copyIsNearlyShallow.
	"ensure superType"
	original superType.
	copy := original
		copyWithParameters:
			{('@A'
				->
					(TypNamedTypeInitializingExamples new typeNamedWithoutClassDescription))}
				asDictionary.
	self assert: original ~~ copy.
	self assert: original superType isNotNil.
	self assert: original superType = copy superType.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	self assert: original parameters isNotNil.
	self assert: original parameters ~~ copy parameters.
	self assert: original parameters keys = copy parameters keys.
	self
		assert: (copy at: '@A')
		equals:
			(TypNamedTypeInitializingExamples new typeNamedWithoutClassDescription).
	^ copy
]
