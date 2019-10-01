Class {
	#name : #TypParametricTypeExamples,
	#superclass : #TypNamedTypeExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> asTypeCompatibleWith [
	<gtExample>
	| type |
	type := self type.
	self
		assert:
			(type asTypeCompatibleWith: TypUnknownType instance)
				= TypUnknownType instance.
	self
		assert: (type asTypeCompatibleWith: TypNilType instance) = type asNullableType.
	self assert: (type asTypeCompatibleWith: self typeOrderedCollectionE) = type.
	self assert: (self typeOrderedCollectionE asTypeCompatibleWith: type) = type.
	self
		assert:
			(type asTypeCompatibleWith: self typeSequenceableCollectionInteger)
				= self typeSequenceableCollectionInteger.
	self
		assert:
			(type asTypeCompatibleWith: self typeSequenceableCollectionString)
				= self typeSequenceableCollectionObject.
	self
		assert:
			(type asTypeCompatibleWith: self typeNotAClass)
				= TypUnknownType instance.
	^ type
]

{ #category : #testing }
TypParametricTypeExamples >> classDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type classDescription = OrderedCollection.
	self assert: [ self typeNotAClass classDescription ] signals: TypNoClassDescriptionError.
	^ type
]

{ #category : #testing }
TypParametricTypeExamples >> hasSuperType [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasSuperType.
	self assert: self typeOrderedCollectionE hasSuperType.
	self assert: self typeNotAClass hasSuperType not.
	^ type
]

{ #category : #testing }
TypParametricTypeExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: type isParametric.
	^ type
]

{ #category : #accessing }
TypParametricTypeExamples >> printOn [
	<gtExample>
	| type |
	type := self type.
	self assert: type asString = 'OrderedCollection<Integer>'.
	self assert: type asNullableType asString = '{!OrderedCollection<Integer>}'.
	^ type
]

{ #category : #testing }
TypParametricTypeExamples >> representsClassDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type representsClassDescription.
	self assert: self typeNotAClass representsClassDescription not.
	^ type
]

{ #category : #testing }
TypParametricTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self assert: type superType = self typeSequenceableCollectionInteger.
	self
		assert:
			self typeOrderedCollectionE superType
				= self typeSequenceableCollectionE.
	self assert: [ self typeNotAClass superType ] signals: TypNoTypeError.
	^ type
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> type [
	^ self typeOrderedCollectionInteger
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeE [
	^ TypTypeVariableType named: '$E'
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeNotAClass [
	^ TypParametricType new
		name: 'notaclass';
		parameters: { self typeInteger };
		yourself
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeNotAClassE [
	^ TypParametricType new
		name: 'notaclass';
		parameters: { self typeE };
		yourself
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeOrderedCollectionE [
	^ TypParametricType new
		name: 'OrderedCollection';
		parameters: { self typeE };
		yourself
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeOrderedCollectionInteger [
	^ TypParametricType new
		name: 'OrderedCollection';
		parameters: { self typeInteger };
		yourself
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeOrderedCollectionObject [
	^ TypParametricType new
		name: 'OrderedCollection';
		parameters: { self typeObject };
		yourself
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeSequenceableCollectionE [
	^ TypParametricType new
		name: 'SequenceableCollection';
		parameters: { self typeE };
		yourself
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeSequenceableCollectionInteger [
	^ TypParametricType new
		name: 'SequenceableCollection';
		parameters: { self typeInteger };
		yourself
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeSequenceableCollectionObject [
	^ TypParametricType new
		name: 'SequenceableCollection';
		parameters: { self typeObject };
		yourself
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeSequenceableCollectionString [
	^ TypParametricType new
		name: 'SequenceableCollection';
		parameters: { self typeString };
		yourself
]
