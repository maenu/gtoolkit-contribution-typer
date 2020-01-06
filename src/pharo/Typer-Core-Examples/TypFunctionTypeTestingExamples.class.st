Class {
	#name : #TypFunctionTypeTestingExamples,
	#superclass : #TypParametricTypeTestingExamples,
	#category : #'Typer-Core-Examples-Type-Testing'
}

{ #category : #testing }
TypFunctionTypeTestingExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: type isFunction.
	^ type
]

{ #category : #generated }
TypFunctionTypeTestingExamples >> type [
	^ TypFunctionType
		classDescription: BlockClosure
		argumentsSize: 1
		argumentsOptional: false
		bindings:
			{('@0' -> Boolean typAsType).
			('@1' -> Integer typAsType)} asDictionary
]
