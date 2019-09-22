Class {
	#name : #TypNilType,
	#superclass : #TypNamedType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypNilType class >> instance [
	<typTypeResultAs: 'TypNilType'>
	^ instance ifNil: [ instance := self new ]
]

{ #category : #converting }
TypNilType >> asNonNullableType [
	^ TypUnknownType instance
]

{ #category : #converting }
TypNilType >> asNullableType [
	^ self
]

{ #category : #'as yet unclassified' }
TypNilType >> asTypeCompatibleWith: aType [
	^ aType asNullableType
]

{ #category : #copying }
TypNilType >> copy [
	^ self
]

{ #category : #initialization }
TypNilType >> initialize [
	super initialize.
	self classDescription: UndefinedObject
]

{ #category : #testing }
TypNilType >> isNil [
	^ true
]

{ #category : #printing }
TypNilType >> printOn: aStream [
	aStream << '!'
]
