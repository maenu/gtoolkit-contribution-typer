Class {
	#name : #TypNilType,
	#superclass : #TypNamedType,
	#category : 'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypNilType class >> classDescription: aClassDescription [
	self shouldNotImplement
]

{ #category : #'instance creation' }
TypNilType class >> named: aString [
	self shouldNotImplement
]

{ #category : #converting }
TypNilType >> asCompatibleWith: aType [
	^ aType asNullable
]

{ #category : #converting }
TypNilType >> asNonNullable [

	^ self addDependent: TypUnknownType new label: #asNonNullable
]

{ #category : #converting }
TypNilType >> asNullable [
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
TypNilType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << '!'
]
