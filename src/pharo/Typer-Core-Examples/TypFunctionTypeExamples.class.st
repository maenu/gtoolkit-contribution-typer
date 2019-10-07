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
	self
		assert:
			(type asCompatibleWith: self typeNonOptionalTwoArguments)
				= TypUnknownType instance.
	self
		assert:
			(type asCompatibleWith: self typeOptionalArgumentVariableResult)
				= TypUnknownType instance.
	self
		assert:
			(type asCompatibleWith: self typeNonOptionalArgumentVariableResult)
				= TypUnknownType instance.
	self
		assert:
			(type asCompatibleWith: self typeNonOptionalTwoArguments)
				= TypUnknownType instance.
	self
		assert:
			(self typeNonOptionalArgumentVariableResult asCompatibleWith: self typeNonOptionalArgumentVariableResultBound)
				= self typeNonOptionalArgumentVariableResult.
	self
		assert:
			(self typeNonOptionalArgumentVariableResultBound asCompatibleWith: self typeNonOptionalArgumentVariableResult)
				= self typeNonOptionalArgumentVariableResult.
	self
		assert:
			(self typeNonOptionalVariableArgument asCompatibleWith: self typeNonOptionalVariableArgumentBound)
				= self typeNonOptionalVariableArgument.
	self
		assert:
			(self typeNonOptionalVariableArgument asCompatibleWith: self typeNonOptionalVariableArgumentBound)
				= self typeNonOptionalVariableArgument.
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
	self assert: self typeOptionalArgumentVariableResult hasSuperType not.
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
TypFunctionTypeExamples >> lookupSelector [
	<gtExample>
	| type |
	type := self type.
	self
		assert: [ type lookupSelector: #notThere ]
		signals: ShouldNotImplement.
	^ type
]

{ #category : #accessing }
TypFunctionTypeExamples >> printOn [
	<gtExample>
	| type |
	type := self type.
	self assert: type asString = '(Integer)->Boolean'.
	self assert: self typeOptionalArgument asString = '[Integer]->Boolean'.
	self assert: self typeNonOptionalTwoArguments asString = '(Integer,Character)->Boolean'.
	^ type
]

{ #category : #testing }
TypFunctionTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self
		assert: type superType = (type copyWithResult: type result superType).
	self
		assert:
			self typeNonOptionalTwoArguments superType
				=
					(self typeNonOptionalTwoArguments
						copyWithResult: self typeNonOptionalTwoArguments result superType).
	self
		assert:
			self typeOptionalArgument superType
				=
					(self typeOptionalArgument
						copyWithResult: self typeOptionalArgument result superType).
	self
		assert: [ self typeOptionalArgumentVariableResult superType ]
		signals: AssertionFailure.
	^ type
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> type [
	^ self typeNonOptionalArgument
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArgument [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@0' typAsType -> Boolean typAsType).
			('@1' typAsType -> Integer typAsType)} typAsTypeVariableBindings
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArgumentObjectResult [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@0' typAsType -> True typAsType).
			('@1' typAsType -> Integer typAsType)} typAsTypeVariableBindings
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArgumentTrueResult [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@0' typAsType -> True typAsType).
			('@1' typAsType -> Integer typAsType)} typAsTypeVariableBindings
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArgumentVariableResult [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@A' typAsType -> '@A' typAsType).
			('@0' typAsType -> '@A' typAsType).
			('@1' typAsType -> Integer typAsType)} typAsTypeVariableBindings
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArgumentVariableResultBound [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@A' typAsType -> Boolean typAsType).
			('@0' typAsType -> '@A' typAsType).
			('@1' typAsType -> Integer typAsType)} typAsTypeVariableBindings
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalTwoArguments [
	^ TypFunctionType
		argumentsSize: 2
		argumentsOptional: false
		bindings:
			{('@0' typAsType -> Boolean typAsType).
			('@1' typAsType -> Integer typAsType).
			('@2' typAsType -> Character typAsType)} typAsTypeVariableBindings
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalVariableArgument [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@A' typAsType -> '@A' typAsType).
			('@0' typAsType -> Boolean typAsType).
			('@1' typAsType -> '@A' typAsType)} typAsTypeVariableBindings
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalVariableArgumentBound [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@A' typAsType -> Integer typAsType).
			('@0' typAsType -> Boolean typAsType).
			('@1' typAsType -> '@A' typAsType)} typAsTypeVariableBindings
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeOptionalArgument [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: true
		bindings:
			{('@0' typAsType -> Boolean typAsType).
			('@1' typAsType -> Integer typAsType)} typAsTypeVariableBindings
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeOptionalArgumentVariableResult [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: true
		bindings:
			{('@A' typAsType -> '@A' typAsType).
			('@0' typAsType -> '@A' typAsType).
			('@1' typAsType -> Integer typAsType)} typAsTypeVariableBindings
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeOptionalVariableArgument [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: true
		bindings:
			{('@A' typAsType -> '@A' typAsType).
			('@0' typAsType -> Boolean typAsType).
			('@1' typAsType -> '@A' typAsType)} typAsTypeVariableBindings
]
