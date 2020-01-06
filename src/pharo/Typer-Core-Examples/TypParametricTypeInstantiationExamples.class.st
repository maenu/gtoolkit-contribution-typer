Class {
	#name : #TypParametricTypeInstantiationExamples,
	#superclass : #TypNamedTypeInstantiationExamples,
	#category : #'Typer-Core-Examples-Type-Instantiation'
}

{ #category : #accessing }
TypParametricTypeInstantiationExamples >> typeClassDescription [
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
TypParametricTypeInstantiationExamples >> typeNamedWithClassDescription [
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
TypParametricTypeInstantiationExamples >> typeNamedWithoutClassDescription [
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
