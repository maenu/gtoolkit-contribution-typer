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
		at: original parameters first
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
	self assert: original bindings isNotNil.
	self assert: original bindings ~~ copy bindings.
	self assert: original bindings = copy bindings.
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
		copyWithBindings:
			{('@A'
				->
					(TypNamedTypeInitializingExamples new typeNamedWithoutClassDescription))}
				asDictionary.
	self assert: original ~~ copy.
	self assert: original superType isNotNil.
	self assert: original superType == copy superType.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	self assert: original parameters isNotNil.
	self assert: original parameters ~~ copy parameters.
	self assert: original parameters = copy parameters.
	self assert: original bindings isNotNil.
	self assert: original bindings ~= copy bindings.
	self
		assert: (copy at: '@A')
		equals:
			(TypNamedTypeInitializingExamples new typeNamedWithoutClassDescription).
	^ copy
]
