Class {
	#name : #TypFunctionTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Copying'
}

{ #category : #accessing }
TypFunctionTypeCopyingExamples >> copyIsNearlyShallow [
	<gtExample>
	| original copy |
	original := TypFunctionTypeInitializingExamples new typeClassDescriptionArgumentsSize.
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
	self assert: original argumentsSize == copy argumentsSize.
	self assert: original argumentsOptional == copy argumentsOptional.
	^ copy
]

{ #category : #accessing }
TypFunctionTypeCopyingExamples >> copyWithBindings [
	<gtExample>
	| original copy |
	original := self copyIsNearlyShallow.
	"ensure superType"
	original superType.
	copy := original
		copyWithParameters:
			{('@0'
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
		assert: (copy at: '@0')
		equals:
			(TypNamedTypeInitializingExamples new typeNamedWithoutClassDescription).
	^ copy
]

{ #category : #accessing }
TypFunctionTypeCopyingExamples >> copyWithResult [
	<gtExample>
	| original copy |
	original := self copyIsNearlyShallow.
	"ensure superType"
	original superType.
	copy := original
		copyWithResult:
			(TypNamedTypeInitializingExamples new typeNamedWithoutClassDescription).
	self assert: original ~~ copy.
	self assert: original superType isNotNil.
	self assert: original superType = copy superType.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	self assert: original parameters isNotNil.
	self assert: original parameters ~~ copy parameters.
	self assert: original parameters keys = copy parameters keys.
	self
		assert: (copy at: '@0')
		equals:
			(TypNamedTypeInitializingExamples new typeNamedWithoutClassDescription).
	^ copy
]
