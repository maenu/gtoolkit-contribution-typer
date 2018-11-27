Class {
	#name : #TypNilType,
	#superclass : #TypClassType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypNilType class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #converting }
TypNilType >> asParametricType: someTypes [
	TypCannotBeParametricTypeError signal
]

{ #category : #converting }
TypNilType >> canBeParametricType [
	^ false
]

{ #category : #accessing }
TypNilType >> hasSuperType [
	^ false
]

{ #category : #initialization }
TypNilType >> initialize [
	super initialize.
	clazz := UndefinedObject
]

{ #category : #testing }
TypNilType >> isNil [
	^ true
]

{ #category : #printing }
TypNilType >> printOn: aStream [
	aStream << 'nil'
]

{ #category : #accessing }
TypNilType >> superType [
	TypNoSuperTypeError signal
]
