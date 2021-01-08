Class {
	#name : #TypFunctionTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Copying'
}

{ #category : #accessing }
TypFunctionTypeCopyingExamples >> copyIsNearlyShallow [
	<gtExample>
	| original copy |
	original := TypFunctionTypeInitializingExamples
		typGtExampleValue: #typeClassDescriptionArgumentsSize.
	original
		at: original parameters first
		put:
			(TypNamedTypeInitializingExamples
				typGtExampleValue: #typeClassDescription).
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
	self assert: original argumentsSize == copy argumentsSize.
	self assert: original argumentsOptional == copy argumentsOptional.
	^ copy
]
