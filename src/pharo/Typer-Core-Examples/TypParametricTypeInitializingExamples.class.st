Class {
	#name : #TypParametricTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #accessing }
TypParametricTypeInitializingExamples >> classDescription [
	<gtExample>
	self
		assert: [ TypParametricType classDescription: Integer ]
		signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypParametricTypeInitializingExamples >> classDescriptionParameters [
	<gtExample>
	| type |
	type := TypParametricType
		classDescription: Integer
		parameters: {(#A -> #A typAsVariableType)} asOrderedDictionary.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuper.
	self
		assert: type super
		equals: (TypNamedType classDescription: Number).
	self
		assert: type parameters
		equals: {(#A -> #A typAsVariableType)} asOrderedDictionary.
	^ type
]

{ #category : #'as yet unclassified' }
TypParametricTypeInitializingExamples >> namedWithClassDescription [
	<gtExample>
	self
		assert: [ TypParametricType named: 'Integer' ]
		signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypParametricTypeInitializingExamples >> namedWithClassDescriptionParameters [
	<gtExample>
	| type |
	type := TypParametricType
		named: 'Integer'
		parameters: {(#A -> #A typAsVariableType)} asOrderedDictionary.
	self assert: type name equals: 'Integer'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: Integer.
	self assert: type hasSuper.
	self
		assert: type super
		equals: (TypNamedType classDescription: Number).
	^ type
]

{ #category : #'as yet unclassified' }
TypParametricTypeInitializingExamples >> namedWithoutClassDescription [
	<gtExample>
	self
		assert: [ TypParametricType named: 'Nothing' ]
		signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypParametricTypeInitializingExamples >> namedWithoutClassDescriptionParameters [
	<gtExample>
	| type |
	type := TypParametricType
		named: 'Nothing'
		parameters: {(#A -> #A typAsVariableType)} asOrderedDictionary.
	self assert: type name equals: 'Nothing'.
	self assert: type hasClassDescription not.
	self assert: [ type classDescription ] signals: AssertionFailure.
	self assert: type hasSuper not.
	self assert: [ type super ] signals: AssertionFailure.
	^ type
]
