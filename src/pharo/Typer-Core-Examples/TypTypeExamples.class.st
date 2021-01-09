Class {
	#name : #TypTypeExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-OLD-Type'
}

{ #category : #testing }
TypTypeExamples class >> isAbstract [
	^ self = TypTypeExamples
]

{ #category : #converting }
TypTypeExamples >> asNonNullable [ 
	<gtExample>
	| type nonNullableType |
	type := self type.
	nonNullableType := type asNonNullable.
	self assert: nonNullableType isNullable not.
	self assert: nonNullableType == type.
	^ nonNullableType
]

{ #category : #converting }
TypTypeExamples >> asNullable [
	<gtExample>
	| type nullableType |
	type := self type.
	nullableType := type asNullable.
	self assert: nullableType isNullable.
	self assert: nullableType ~~ type.
	self assert: nullableType >= type.
	self assert: nullableType asNonNullable = type.
	^ nullableType
]

{ #category : #converting }
TypTypeExamples >> asTypeCompatibleWith [
	<gtExample>
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> canUnderstand [
	<gtExample>
	| type |
	type := self type.
	self assert: (type canUnderstand: #notThere) not.
	^ type
]

{ #category : #accessing }
TypTypeExamples >> equality [
	<gtExample>
	| type other |
	type := self type.
	other := self type.
	self assert: type ~~ other.
	self assert: type hash = other hash.
	self assert: type = other.
	self assert: type asNullable hash ~= other hash.
	self assert: type asNullable ~= other.
	^ type
]

{ #category : #testing }
TypTypeExamples >> hasSuperType [
	<gtExample>
	self subclassResponsibility
]

{ #category : #testing }
TypTypeExamples >> isNullable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNullable not.
	^ type
]

{ #category : #accessing }
TypTypeExamples >> lookupSelector [
	<gtExample>
	| type |
	type := self type.
	self
		assert: [ type lookupSelector: #notThere ]
		signals: AssertionFailure.
	^ type
]

{ #category : #accessing }
TypTypeExamples >> monotony [
	<gtExample>
	| type superType |
	type := self type.
	superType := type superType.
	self assert: superType > type.
	self assert: superType >= type.
	self assert: type >= type.
	self assert: type <= type.
	self assert: type <= superType.
	self assert: type < superType.
	^ type
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> printOn [
	<gtExample>
	self subclassResponsibility
]

{ #category : #accessing }
TypTypeExamples >> superType [
	<gtExample>
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> type [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> typeInteger [
	^ TypNamedType named: 'Integer'
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> typeNotAClass [
	^ TypNamedType named: 'notaclass'
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> typeObject [
	^ TypNamedType named: 'Object'
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> typeObjectClass [
	^ TypNamedType named: 'Object class'
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> typeProtoObject [
	^ TypNamedType named: 'ProtoObject'
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> typeProtoObjectClass [
	^ TypNamedType named: 'ProtoObject class'
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> typeString [
	^ TypNamedType named: 'String'
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> typeTAssertable [
	^ TypNamedType named: 'TAssertable'
]

{ #category : #'as yet unclassified' }
TypTypeExamples >> typeTAssertableClassTrait [
	^ TypNamedType named: 'TAssertable classTrait'
]
