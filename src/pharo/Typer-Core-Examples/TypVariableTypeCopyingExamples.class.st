Class {
	#name : #TypVariableTypeCopyingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Copying'
}

{ #category : #accessing }
TypVariableTypeCopyingExamples >> copyIsShallow [

	<gtExample>
	| original copy |
	original := TypVariableTypeInitializingExamples new named 
		            copyWithSuperType:
		            TypNamedTypeInitializingExamples new classDescription.
	copy := original copy.
	self assert: original ~~ copy.
	self assert: original superType isNotNil.
	self assert: original superType == copy superType.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	^ copy
]
