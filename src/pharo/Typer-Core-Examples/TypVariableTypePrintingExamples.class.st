Class {
	#name : #TypVariableTypePrintingExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type-Printing'
}

{ #category : #accessing }
TypVariableTypePrintingExamples >> asString [
	<gtExample>
	| type |
	type := TypVariableTypeInitializingExamples
		typGtExampleValue: #typeNamed.
	self assert: type asString equals: '@A'.
	^ type
]

{ #category : #accessing }
TypVariableTypePrintingExamples >> asStringWithSuperType [
	<gtExample>
	| type |
	type := TypVariableTypeInitializingExamples
		typGtExampleValue: #typeNamedSuperType.
	self assert: type asString equals: '@A<=String'.
	^ type
]
