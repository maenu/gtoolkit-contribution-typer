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

{ #category : #comparing }
TypNilType >> > aType [
	^ aType nullable and: [ self ~= aType ]
]

{ #category : #'as yet unclassified' }
TypNilType >> asCompatibleType: aType [
	^ aType asNullableType
]

{ #category : #converting }
TypNilType >> asNamedType [
	^ self
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
	nullable := true.
	name := UndefinedObject name
]

{ #category : #testing }
TypNilType >> isNil [
	^ true
]

{ #category : #accessing }
TypNilType >> nullable: anObject [
	"do nothing"

	
]
