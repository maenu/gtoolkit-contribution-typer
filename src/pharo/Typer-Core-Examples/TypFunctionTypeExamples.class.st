Class {
	#name : #TypFunctionTypeExamples,
	#superclass : #TypTypeExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #converting }
TypFunctionTypeExamples >> asTypeCompatibleWith [
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
	self
		assert:
			(type asCompatibleWith: self typeProtoObject)
				= self typeProtoObject.
	self
		assert:
			(type asCompatibleWith: self typeNotAClass)
				= TypUnknownType instance.
	^ type
]

{ #category : #testing }
TypFunctionTypeExamples >> hasSuperType [
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
TypFunctionTypeExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction.
	^ type
]

{ #category : #accessing }
TypFunctionTypeExamples >> printOn [
	<gtExample>
	| type |
	type := self type.
	self assert: type asString = 'Object'.
	self assert: type asNullableType asString = '{!Object}'.
	^ type
]

{ #category : #testing }
TypFunctionTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self assert: type superType = self typeProtoObject.
	self
		assert: self typeObjectClass superType = self typeProtoObjectClass.
	self
		assert: self typeProtoObjectClass superType = (TypNamedType named: 'Class').
	self assert: [ self typeNotAClass superType ] signals: AssertionFailure.
	^ type
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> type [
	^ self typeNonOptionalArguments
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArguments [
	^ TypFunctionType
		arguments: {Integer typAsType}
		result: Boolean typAsType
		optionalArguments: false
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeOptionalArguments [
	^ TypFunctionType
		arguments: {Integer typAsType}
		result: Boolean typAsType
		optionalArguments: true
]
