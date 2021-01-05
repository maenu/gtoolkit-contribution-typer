Class {
	#name : #TypCopyExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Copying'
}

{ #category : #accessing }
TypCopyExamples >> copyFunctionIsNearlyShallow [
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
	self assert: (original at: original parameters first) isNotNil.
	self
		assert:
			(original at: original parameters first)
				== (copy at: copy parameters first).
	original
		at: original parameters first
		put: (TypNilTypeInitializingExamples typGtExampleValue: #typeInstance).
	self
		assert:
			(original at: original parameters first)
				~~ (copy at: copy parameters first).
	^ original
]

{ #category : #accessing }
TypCopyExamples >> copyNamedIsShallow [
	<gtExample>
	| original copy |
	original := TypNamedTypeInitializingExamples
		typGtExampleValue: #typeClassDescription.
	"ensure superType"
	original superType.
	copy := original copy.
	self assert: original ~~ copy.
	self assert: original superType isNotNil.
	self assert: original superType == copy superType.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	^ original
]

{ #category : #accessing }
TypCopyExamples >> copyNilIsSame [
	<gtExample>
	| original copy |
	original := TypNilTypeInitializingExamples
		typGtExampleValue: #typeInstance.
	copy := original copy.
	self assert: original == copy.
	^ original
]

{ #category : #accessing }
TypCopyExamples >> copyParametricIsNearlyShallow [
	<gtExample>
	| original copy |
	original := TypParametricTypeInitializingExamples
		typGtExampleValue: #typeClassDescriptionParameters.
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
	self assert: (original at: original parameters first) isNotNil.
	self
		assert:
			(original at: original parameters first)
				== (copy at: copy parameters first).
	original
		at: original parameters first
		put: (TypNilTypeInitializingExamples typGtExampleValue: #typeInstance).
	self
		assert:
			(original at: original parameters first)
				~~ (copy at: copy parameters first).
	^ original
]

{ #category : #accessing }
TypCopyExamples >> copyUnknownIsSame [
	<gtExample>
	| original copy |
	original := TypUnknownTypeInitializingExamples
		typGtExampleValue: #typeInstance.
	copy := original copy.
	self assert: original == copy.
	^ original
]

{ #category : #accessing }
TypCopyExamples >> copyVariableIsShallow [
	<gtExample>
	| original copy |
	original := TypVariableTypeInitializingExamples
		typGtExampleValue: #typeNamed.
	original
		scope:
			(TypParametricTypeInitializingExamples
				typGtExampleValue: #typeClassDescriptionParameters);
		superType:
			(TypNamedTypeInitializingExamples
				typGtExampleValue: #typeClassDescription).
	copy := original copy.
	self assert: original ~~ copy.
	self assert: original superType isNotNil.
	self assert: original superType == copy superType.
	self assert: original name isNotNil.
	self assert: original name == copy name.
	self assert: original scope isNotNil.
	self assert: original scope == copy scope.
	^ original
]

{ #category : #accessing }
TypCopyExamples >> copyVoidIsSame [
	<gtExample>
	| original copy |
	original := TypVoidTypeInitializingExamples
		typGtExampleValue: #typeInstance.
	copy := original copy.
	self assert: original == copy.
	^ original
]
