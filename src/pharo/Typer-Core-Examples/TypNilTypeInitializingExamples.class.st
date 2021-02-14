Class {
	#name : #TypNilTypeInitializingExamples,
	#superclass : #Object,
	#traits : 'TTypAssertable',
	#classTraits : 'TTypAssertable classTrait',
	#category : #'Typer-Core-Examples-Type-Initializing'
}

{ #category : #accessing }
TypNilTypeInitializingExamples >> typeClassDescription [
	<gtExample>
	self assert: [ TypNilType classDescription: Integer ] signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypNilTypeInitializingExamples >> typeInstance [
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
	self
		assert: type == TypNilType new
		description: 'nil instance should always be the exact same object'.
	^ type
]

{ #category : #accessing }
TypNilTypeInitializingExamples >> typeNamedWithClassDescription [
	<gtExample>
	self assert: [ TypNilType named: 'Integer' ] signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypNilTypeInitializingExamples >> typeNamedWithoutClassDescription [
	<gtExample>
	self assert: [ TypNilType named: 'Nothing' ] signals: ShouldNotImplement.
	^ nil
]
