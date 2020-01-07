Class {
	#name : #TypNilType,
	#superclass : #TypNamedType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypNilType class >> classDescription: aClassDescription [
	self shouldNotImplement
]

{ #category : #accessing }
TypNilType class >> instance [
	<typTypeResultAs: 'TypNilType'>
	^ instance ifNil: [ instance := self new ]
]

{ #category : #'instance creation' }
TypNilType class >> named: aString [
	self shouldNotImplement
]

{ #category : #converting }
TypNilType >> asCompatibleWith: aType [
	^ aType asNullableType
]

{ #category : #converting }
TypNilType >> asNonNullableType [
	^ TypUnknownType instance
]

{ #category : #converting }
TypNilType >> asNullableType [
	^ self
]

{ #category : #copying }
TypNilType >> copy [
	^ self
]

{ #category : #initialization }
TypNilType >> initialize [
	super initialize.
	self initializeClassDescription: UndefinedObject
]

{ #category : #testing }
TypNilType >> isNil [
	^ true
]

{ #category : #printing }
TypNilType >> printOn: aStream [
	aStream << '!'
]
