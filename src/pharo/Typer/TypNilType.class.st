Class {
	#name : #TypNilType,
	#superclass : #TypNamedType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypNilType class >> instance [
	<typTypeResultAs: 'TypNilType'>
	^ instance ifNil: [ instance := self new ]
]

{ #category : #converting }
TypNilType >> asParametricType: someTypes [
	TypNoParametricTypeError signal
]

{ #category : #accessing }
TypNilType >> asSourceString [
	^ 'nil'
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
	name := #UndefinedObject
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
