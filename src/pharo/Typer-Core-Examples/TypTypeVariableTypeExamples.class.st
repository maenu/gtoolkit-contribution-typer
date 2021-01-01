Class {
	#name : #TypTypeVariableTypeExamples,
	#superclass : #TypTypeExamples,
	#category : #'Typer-Core-Examples-OLD-Type'
}

{ #category : #converting }
TypTypeVariableTypeExamples >> asTypeCompatibleWith [
	<gtExample>
	| type |
	type := self type.
	self
		assert:
			(type asCompatibleWith: TypUnknownType instance)
				= TypUnknownType instance.
	self
		assert: (type asCompatibleWith: TypNilType instance) = type asNullableType.
	self assert: (type asCompatibleWith: self typeInteger) = type.
	self assert: (type asCompatibleWith: self typeProtoObject) = type.
	self assert: (type asCompatibleWith: self typeNotAClass) = TypUnknownType instance.
	^ type
]

{ #category : #'as yet unclassified' }
TypTypeVariableTypeExamples >> canUnderstand [
	<gtExample>
	| type |
	type := self type.
	self assert: (type canUnderstand: #notThere) not.
	self assert: (type canUnderstand: #asCamelCase) not.
	self assert: (type canUnderstand: #asFraction) not.
	self assert: (self typeAInteger canUnderstand: #notThere) not.
	self assert: (self typeAInteger canUnderstand: #asCamelCase) not.
	self assert: (self typeAInteger canUnderstand: #asFraction).
	self assert: (self typeAString canUnderstand: #notThere) not.
	self assert: (self typeAString canUnderstand: #asCamelCase).
	self assert: (self typeAString canUnderstand: #asFraction) not.
	^ type
]

{ #category : #testing }
TypTypeVariableTypeExamples >> hasSuperType [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasSuperType.
	self assert: self typeB hasSuperType.
	self assert: self typeAInteger hasSuperType.
	self assert: self typeAString hasSuperType.
	^ type
]

{ #category : #accessing }
TypTypeVariableTypeExamples >> lookupSelector [
	<gtExample>
	| type |
	type := self type.
	self
		assert: [ type lookupSelector: #notThere ]
		signals: AssertionFailure.
	self
		assert: [ type lookupSelector: #asCamelCase ]
		signals: AssertionFailure.
	self
		assert: [ type lookupSelector: #asFraction ]
		signals: AssertionFailure.
	self
		assert: [ self typeAInteger lookupSelector: #notThere ]
		signals: AssertionFailure.
	self
		assert: [ self typeAInteger lookupSelector: #asCamelCase ]
		signals: AssertionFailure.
	self
		assert: (self typeAInteger lookupSelector: #asFraction) isNotEmpty.
	self
		assert: [ self typeAString lookupSelector: #notThere ]
		signals: AssertionFailure.
	self
		assert: (self typeAString lookupSelector: #asCamelCase) isNotEmpty.
	self
		assert: [ self typeAString lookupSelector: #asFraction ]
		signals: AssertionFailure.
	^ type
]

{ #category : #accessing }
TypTypeVariableTypeExamples >> printOn [
	<gtExample>
	| type |
	type := self type.
	self assert: type asString = '@A'.
	self assert: type asNullableType asString = '{!,@A}'.
	self assert: self typeB asString = '@B'.
	self assert: self typeAInteger asString = '@A<=Integer'.
	self assert: self typeAString asString = '@A<=String'.
	^ type
]

{ #category : #accessing }
TypTypeVariableTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self assert: type superType = self typeProtoObject.
	self assert: self typeB superType = self typeProtoObject.
	self assert: self typeAInteger superType = self typeInteger.
	self assert: self typeAString superType = self typeString.
	^ type
]

{ #category : #'as yet unclassified' }
TypTypeVariableTypeExamples >> type [
	^ self typeA
]

{ #category : #requirements }
TypTypeVariableTypeExamples >> typeA [
	^ TypTypeVariableType named: '@A'
]

{ #category : #requirements }
TypTypeVariableTypeExamples >> typeAInteger [
	^ TypTypeVariableType named: '@A' superType: self typeInteger
]

{ #category : #requirements }
TypTypeVariableTypeExamples >> typeAString [
	^ TypTypeVariableType named: '@A' superType: self typeString
]

{ #category : #requirements }
TypTypeVariableTypeExamples >> typeB [
	^ TypTypeVariableType named: '@B'
]
