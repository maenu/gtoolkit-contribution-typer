Class {
	#name : #TypFunctionTypeExamples,
	#superclass : #TypTypeExamples,
	#category : #'Typer-Core-Examples-Type'
}

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
	self assert: self typeOptionalArguments asString = '[Integer]->Boolean'.
	self assert: self typeNonOptionalTwoArguments asString = '(Integer,Character)->Boolean'.
	^ type
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> type [
	^ self typeNonOptionalArguments
]

{ #category : #'as yet unclassified' }
TypFunctionTypeExamples >> typeNonOptionalArguments [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@0' typAsType -> Boolean typAsType).
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
TypFunctionTypeExamples >> typeOptionalArguments [
	^ TypFunctionType
		argumentsSize: 1
		argumentsOptional: true
		bindings:
			{('@0' typAsType -> Boolean typAsType).
			('@1' typAsType -> Integer typAsType)} typAsTypeVariableBindings
]
