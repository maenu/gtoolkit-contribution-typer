Class {
	#name : #TypTypeExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #testing }
TypTypeExamples class >> isAbstract [
	^ self = TypTypeExamples
]

{ #category : #converting }
TypTypeExamples >> asNonNullableType [ 
	<gtExample>
	| type nonNullableType |
	type := self type.
	nonNullableType := type asNonNullableType.
	self assert: nonNullableType isNullable not.
	self assert: nonNullableType == type.
	^ nonNullableType
]

{ #category : #converting }
TypTypeExamples >> asNullableType [
	<gtExample>
	| type nullableType |
	type := self type.
	nullableType := type asNullableType.
	self assert: nullableType isNullable.
	self assert: nullableType ~~ type.
	self assert: nullableType >= type.
	self assert: nullableType asNonNullableType = type.
	^ nullableType
]

{ #category : #converting }
TypTypeExamples >> asTypeCompatibleWith [
	<gtExample>
	self subclassResponsibility
]

{ #category : #asserting }
TypTypeExamples >> assert: aBlock signals: aClass [
	| signaled |
	signaled := false.
	aBlock
		on: aClass
		do: [ signaled := true ].
	self assert: signaled
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
	self assert: type asNullableType hash ~= other hash.
	self assert: type asNullableType ~= other.
	^ type
]

{ #category : #testing }
TypTypeExamples >> hasSuperType [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasSuperType not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isNil [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNil not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isNullable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNullable not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isTypeVariable [
	<gtExample>
	| type |
	type := self type.
	self assert: type isTypeVariable not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion not.
	^ type
]

{ #category : #testing }
TypTypeExamples >> isUnknown [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnknown not.
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
	| type |
	type := self type.
	self assert: [ type superType ] signals: AssertionFailure.
	^ type
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
