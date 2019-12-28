Class {
	#name : #TypFunctionTypeExamples,
	#superclass : #TypParametricTypeExamples,
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
	self
		assert:
			(type asCompatibleWith: self typeNonOptionalTwoArguments)
				= Object typAsType.
	self
		assert:
			(type asCompatibleWith: self typeOptionalArgumentVariableResult)
				= Object typAsType.
	self
		assert:
			(type asCompatibleWith: self typeNonOptionalArgumentVariableResult)
				= Object typAsType.
	self
		assert:
			(type asCompatibleWith: self typeNonOptionalTwoArguments)
				= Object typAsType.
	self
		assert:
			(self typeNonOptionalArgumentVariableResult
				asCompatibleWith: self typeNonOptionalArgumentVariableResultBound)
				= self typeNonOptionalArgumentVariableResult.
	self
		assert:
			(self typeNonOptionalArgumentVariableResultBound
				asCompatibleWith: self typeNonOptionalArgumentVariableResult)
				= self typeNonOptionalArgumentVariableResult.
	self
		assert:
			(self typeNonOptionalVariableArgument
				asCompatibleWith: self typeNonOptionalVariableArgumentBound)
				= self typeNonOptionalVariableArgument.
	self
		assert:
			(self typeNonOptionalVariableArgument
				asCompatibleWith: self typeNonOptionalVariableArgumentBound)
				= self typeNonOptionalVariableArgument.
	^ type
]

{ #category : #testing }
TypFunctionTypeExamples >> classDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type classDescription = BlockClosure.
	self assert: [ self typeNotAClass classDescription ] signals: AssertionFailure.
	^ type
]

{ #category : #testing }
TypFunctionTypeExamples >> hasSuperType [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasSuperType.
	self assert: self typeNonOptionalTwoArguments hasSuperType.
	self assert: self typeOptionalArgument hasSuperType.
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
	self assert: type asString = 'BlockClosure(Integer)->Boolean'.
	self assert: self typeOptionalArgument asString = 'BlockClosure[Integer]->Boolean'.
	self assert: self typeNonOptionalTwoArguments asString = 'BlockClosure(Integer,Character)->Boolean'.
	^ type
]

{ #category : #testing }
TypFunctionTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self assert: type superType = Object typAsType.
	self
		assert: self typeNonOptionalTwoArguments superType = Object typAsType.
	self assert: self typeOptionalArgument superType = Object typAsType.
	self
		assert: self typeOptionalArgumentVariableResult superType = Object typAsType.
	^ type
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> type [
	^ self typeNonOptionalArgument
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArgument [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@0' -> Boolean typAsType).
			('@1' -> Integer typAsType)} asDictionary
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArgumentObjectResult [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@0' -> True typAsType).
			('@1' -> Integer typAsType)} asDictionary
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArgumentTrueResult [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@0' -> True typAsType).
			('@1' -> Integer typAsType)} asDictionary
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArgumentVariableResult [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@A' -> '@A' typAsType).
			('@0' -> '@A' typAsType).
			('@1' -> Integer typAsType)} asDictionary
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArgumentVariableResultBound [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@A' -> Boolean typAsType).
			('@0' -> '@A' typAsType).
			('@1' -> Integer typAsType)} asDictionary
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalTwoArguments [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 2
		argumentsOptional: false
		bindings:
			{('@0' -> Boolean typAsType).
			('@1' -> Integer typAsType).
			('@2' -> Character typAsType)} asDictionary
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalVariableArgument [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@A' -> '@A' typAsType).
			('@0' -> Boolean typAsType).
			('@1' -> '@A' typAsType)} asDictionary
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalVariableArgumentBound [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@A' -> Integer typAsType).
			('@0' -> Boolean typAsType).
			('@1' -> '@A' typAsType)} asDictionary
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNotAClass [
	^ TypFunctionType
		named: 'notaclass'
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@0' -> Boolean typAsType).
			('@1' -> Integer typAsType)} asDictionary
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeOptionalArgument [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 1
		argumentsOptional: true
		bindings:
			{('@0' -> Boolean typAsType).
			('@1' -> Integer typAsType)} asDictionary
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeOptionalArgumentVariableResult [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 1
		argumentsOptional: true
		bindings:
			{('@A' -> '@A' typAsType).
			('@0' -> '@A' typAsType).
			('@1' -> Integer typAsType)} asDictionary
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeOptionalVariableArgument [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 1
		argumentsOptional: true
		bindings:
			{('@A' -> '@A' typAsType).
			('@0' -> Boolean typAsType).
			('@1' -> '@A' typAsType)} asDictionary
]
