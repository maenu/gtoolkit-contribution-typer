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
	^ self ~= aType and: [ aType nullable ]
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

{ #category : #'as yet unclassified' }
TypNilType >> asTypeCompatibleWith: aType [
	^ aType asNullableType
]

{ #category : #copying }
TypNilType >> copy [
	^ self
]

{ #category : #'as yet unclassified' }
TypNilType >> hasSuperType [
	^ false
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

{ #category : #'as yet unclassified' }
TypNilType >> superType [
	TypNoTypeError signal
]
