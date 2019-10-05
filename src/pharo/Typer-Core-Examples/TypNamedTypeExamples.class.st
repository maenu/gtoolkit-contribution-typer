Class {
	#name : #TypNamedTypeExamples,
	#superclass : #TypTypeExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #testing }
TypNamedTypeExamples >> classDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type classDescription = Object.
	self assert: [ self typeNotAClass classDescription ] signals: AssertionFailure.
	self assert: self typeObjectClass classDescription = Object class.
	self assert: self typeTAssertable classDescription = TAssertable.
	self
		assert:
			self typeTAssertableClassTrait classDescription = TAssertable class.
	^ type
]

{ #category : #testing }
TypNamedTypeExamples >> hasClassDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasClassDescription.
	self assert: self typeNotAClass hasClassDescription not.
	self assert: self typeObjectClass hasClassDescription.
	self assert: self typeTAssertable hasClassDescription.
	self
		assert: self typeTAssertableClassTrait hasClassDescription.
	^ type
]

{ #category : #testing }
TypNamedTypeExamples >> hasSuperType [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasSuperType.
	self assert: self typeObjectClass hasSuperType.
	self assert: self typeProtoObject hasSuperType not.
	self assert: self typeProtoObjectClass hasSuperType.
	self assert: self typeNotAClass hasSuperType not.
	^ type
]

{ #category : #testing }
TypNamedTypeExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed.
	^ type
]

{ #category : #accessing }
TypNamedTypeExamples >> printOn [
	<gtExample>
	| type |
	type := self type.
	self assert: type asString = 'Object'.
	self assert: type asNullableType asString = '{!Object}'.
	^ type
]

{ #category : #testing }
TypNamedTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self assert: type superType = self typeProtoObject.
	self
		assert: self typeObjectClass superType = self typeProtoObjectClass.
	self
		assert: self typeProtoObjectClass superType = (TypNamedType named: 'Class').
	self assert: [ self typeNotAClass superType ] signals: TypNoTypeError.
	^ type
]

{ #category : #'as yet unclassified' }
TypNamedTypeExamples >> type [
	^ self typeObject
]
