Class {
	#name : #TypNilTypeInitializationExamples,
	#superclass : #TypNamedTypeInitializationExamples,
	#category : #'Typer-Core-Examples-Type-Initialization'
}

{ #category : #accessing }
TypNilTypeInitializationExamples >> typeClassDescription [
	<gtExample>
	self assert: [ TypNilType classDescription: Integer ] signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypNilTypeInitializationExamples >> typeInstance [
	<gtExample>
	| type |
	type := TypNilType instance.
	self assert: type name equals: 'UndefinedObject'.
	self assert: type hasClassDescription.
	self assert: type classDescription equals: UndefinedObject.
	self assert: type hasSuperType.
	self assert: type superType equals: (TypNamedType classDescription: Object).
	self assert: type == TypNilType instance description: 'nil instance should always be the exact same object'.
	^ type
]

{ #category : #accessing }
TypNilTypeInitializationExamples >> typeNamedWithClassDescription [
	<gtExample>
	self assert: [ TypNilType named: 'Integer' ] signals: ShouldNotImplement.
	^ nil
]

{ #category : #accessing }
TypNilTypeInitializationExamples >> typeNamedWithoutClassDescription [
	<gtExample>
	self assert: [ TypNilType named: 'Nothing' ] signals: ShouldNotImplement.
	^ nil
]
