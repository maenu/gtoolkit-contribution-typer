Class {
	#name : #TypNilTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #accessing }
TypNilTypeInitializingExamples >> classDescription [
	<gtExample>
	self assert: [ TypNilType classDescription: Integer ] signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypNilTypeInitializingExamples >> namedWithClassDescription [
	<gtExample>
	self assert: [ TypNilType named: 'Integer' ] signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypNilTypeInitializingExamples >> namedWithoutClassDescription [
	<gtExample>
	self assert: [ TypNilType named: 'Nothing' ] signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypNilTypeInitializingExamples >> new [
	<gtExample>
	| type |
	type := TypNilType new.
	self assert: type name equals: 'UndefinedObject'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: UndefinedObject.
	self assert: type hasSuperType.
	self
		assert: type superType
		equals: (TypNamedType classDescription: Object).
	^ type
]
