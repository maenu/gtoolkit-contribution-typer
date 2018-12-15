Class {
	#name : #TypUnknownType,
	#superclass : #TypType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypUnknownType class >> instance [
	<typTypeResultAs: 'TypUnknownType'>
	^ instance ifNil: [ instance := self new ]
]

{ #category : #comparing }
TypUnknownType >> < aType [
	^ true
]

{ #category : #comparing }
TypUnknownType >> > aType [
	^ true
]

{ #category : #converting }
TypUnknownType >> asClass [
	TypNoClassError signal
]

{ #category : #converting }
TypUnknownType >> asFunctionType: someTypes result: aType [
	TypNoTypeError signal
]

{ #category : #converting }
TypUnknownType >> asParametricType: someTypes [
	TypNoTypeError signal
]

{ #category : #accessing }
TypUnknownType >> asSourceString [
	^ '?'
]

{ #category : #accessing }
TypUnknownType >> hasSuperType [
	^ false
]

{ #category : #testing }
TypUnknownType >> isUnknown [
	^ true
]

{ #category : #accessing }
TypUnknownType >> printOn: aStream [
	super printOn: aStream.
	aStream << '?'
]

{ #category : #accessing }
TypUnknownType >> superType [
	TypNoSuperTypeError signal
]
