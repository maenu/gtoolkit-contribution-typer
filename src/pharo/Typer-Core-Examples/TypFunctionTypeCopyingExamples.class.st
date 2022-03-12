Class {
	#name : #TypFunctionTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Copying'
}

{ #category : #accessing }
TypFunctionTypeCopyingExamples >> copyIsNearlyShallow [

	<gtExample>
	| original copy |
	original := TypFunctionTypeInitializingExamples new
		            classDescriptionArgumentsSizeArgumentsOptionalBindings.
	original parameters
		at: #'0'
		put: TypNamedTypeInitializingExamples new classDescription.
	"ensure superType"
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
	self assert: original argumentsSize == copy argumentsSize.
	self assert: original argumentsOptional == copy argumentsOptional.
	^ copy
]

{ #category : #accessing }
TypFunctionTypeCopyingExamples >> copyWithParameters [
	<gtExample>
	| original copy |
	original := TypFunctionTypeInitializingExamples new
		classDescriptionArgumentsSizeArgumentsOptionalBindings.
	"ensure superType"
	original super.
	copy := original
		withParameters:
			{TypNamedTypeInitializingExamples new namedWithoutClassDescription.
			TypNilTypeInitializingExamples new new}.
	self assert: original ~~ copy.
	self assert: original super isNotNil.
	self assert: original super = copy super.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	self assert: original parameters isNotNil.
	self assert: original parameters ~~ copy parameters.
	self assert: original parameters keys = copy parameters keys.
	self
		assert: (copy at: #'0')
		equals: TypNamedTypeInitializingExamples new namedWithoutClassDescription.
	self
		assert: (copy at: #'1')
		equals: TypNilTypeInitializingExamples new new.
	^ copy
]
