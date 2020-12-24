Class {
	#name : #TypParametricTypeInitializationExamples,
	#superclass : #TypNamedTypeInitializationExamples,
	#category : #'Typer-Core-Examples-Type-Initialization'
}

{ #category : #accessing }
TypParametricTypeInitializationExamples >> typeClassDescription [
	<gtExample>
	| type |
	type := TypParametricType
		classDescription: Integer
		parameters: {'@A'}.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self
		assert: type superType
		equals: (TypNamedType classDescription: Number).
	self assert: type parameters equals: {'@A'}.
	^ type
]

{ #category : #'as yet unclassified' }
TypParametricTypeInitializationExamples >> typeNamedWithClassDescription [
	<gtExample>
	| type |
	type := TypParametricType
		named: 'Integer'
		parameters: {'@A'}.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuperType.
	self assert: type superType equals: (TypNamedType classDescription: Number).
	^ type
]

{ #category : #'as yet unclassified' }
TypParametricTypeInitializationExamples >> typeNamedWithoutClassDescription [
	<gtExample>
	| type |
	type := TypParametricType
		named: 'Nothing'
		parameters: {'@A'}.
	self assert: type name equals: 'Nothing'.
	self assert: type hasClassDescription not.
	self assert: [ type classDescription ] signals: AssertionFailure.
	self assert: type hasSuperType not.
	self assert: [ type superType ] signals: AssertionFailure.
	^ type
]
