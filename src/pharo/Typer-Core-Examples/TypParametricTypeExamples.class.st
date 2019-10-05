Class {
	#name : #TypParametricTypeExamples,
	#superclass : #TypNamedTypeExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #converting }
TypParametricTypeExamples >> asTypeCompatibleWith [
	<gtExample>
	| type |
	type := self type.
	self
		assert:
			(type asCompatibleWith: TypUnknownType instance)
				= TypUnknownType instance.
	self
		assert: (type asCompatibleWith: TypNilType instance) = type asNullableType.
	self
		assert: (type asCompatibleWith: self typeOrderedCollectionA) = self typeOrderedCollectionA.
	self
		assert: (self typeOrderedCollectionA asCompatibleWith: type) = self typeOrderedCollectionA.
	self
		assert:
			(type asCompatibleWith: self typeSequenceableCollectionInteger)
				= self typeSequenceableCollectionInteger.
	self
		assert:
			(type asCompatibleWith: self typeSequenceableCollectionString)
				= self typeSequenceableCollectionA.
	self
		assert:
			(type asCompatibleWith: self typeNotAClass)
				= TypUnknownType instance.
	^ type
]

{ #category : #testing }
TypParametricTypeExamples >> classDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type classDescription = OrderedCollection.
	self assert: [ self typeNotAClass classDescription ] signals: AssertionFailure.
	^ type
]

{ #category : #testing }
TypParametricTypeExamples >> hasClassDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasClassDescription.
	self assert: self typeNotAClass hasClassDescription not.
	^ type
]

{ #category : #testing }
TypParametricTypeExamples >> hasSuperType [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasSuperType.
	self assert: self typeOrderedCollectionA hasSuperType.
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
TypParametricTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self assert: type superType = self typeSequenceableCollectionInteger.
	self
		assert:
			self typeOrderedCollectionA superType
				= self typeSequenceableCollectionA.
	self assert: [ self typeNotAClass superType ] signals: AssertionFailure.
	^ type
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> type [
	^ self typeOrderedCollectionInteger
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeA [
	^ TypTypeVariableType named: '@A'
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeNotAClass [
	^ TypParametricType
		named: 'notaclass'
		bindings: {('@A' -> self typeInteger)} asOrderedDictionary
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeNotAClassA [
	^ TypParametricType
		named: 'notaclass'
		bindings: {('@A' -> self typeA)} asOrderedDictionary
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeOrderedCollectionA [
	^ TypParametricType
		named: 'OrderedCollection'
		bindings: {('@A' -> self typeA)} asOrderedDictionary
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeOrderedCollectionInteger [
	^ TypParametricType
		named: 'OrderedCollection'
		bindings: {('@A' -> self typeInteger)} asOrderedDictionary
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeOrderedCollectionObject [
	^ TypParametricType
		named: 'OrderedCollection'
		bindings: {('@A' -> self typeObject)} asOrderedDictionary
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeSequenceableCollectionA [
	^ TypParametricType
		named: 'SequenceableCollection'
		bindings: {('@A' -> self typeA)} asOrderedDictionary
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeSequenceableCollectionInteger [
	^ TypParametricType
		named: 'SequenceableCollection'
		bindings: {('@A' -> self typeInteger)} asOrderedDictionary
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeSequenceableCollectionObject [
	^ TypParametricType
		named: 'SequenceableCollection'
		bindings: {('@A' -> self typeObject)} asOrderedDictionary
]

{ #category : #'as yet unclassified' }
TypParametricTypeExamples >> typeSequenceableCollectionString [
	^ TypParametricType
		named: 'SequenceableCollection'
		bindings: {('@A' -> self typeString)} asOrderedDictionary
]
