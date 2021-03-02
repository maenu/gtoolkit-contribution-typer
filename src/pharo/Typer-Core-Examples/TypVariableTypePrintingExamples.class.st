Class {
	#name : #TypVariableTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Printing'
}

{ #category : #accessing }
TypVariableTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypVariableTypeInitializingExamples new named.
	self assert: type asString equals: '@A'.
	^ type
]

{ #category : #accessing }
TypVariableTypePrintingExamples >> asStringWithSuperType [
	<gtExample>
	| type |
	type := TypVariableTypeInitializingExamples new namedSuperType.
	self assert: type asString equals: '@A<=String'.
	^ type
]
