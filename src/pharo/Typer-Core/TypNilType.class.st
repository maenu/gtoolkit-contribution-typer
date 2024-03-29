Class {
	#name : #TypNilType,
	#superclass : #TypNamedType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Core'
}

{ #category : #'instance creation' }
TypNilType class >> classDescription: aClassDescription [
	self shouldNotImplement
]

{ #category : #'instance creation' }
TypNilType class >> classDescription: aClassDescription super: aType [

	self shouldNotImplement
]

{ #category : #accessing }
TypNilType class >> instance [

	^ instance ifNil: [ instance := self new ]
]

{ #category : #invalidation }
TypNilType class >> invalidate [
	<script>
	super invalidate.
	instance := nil
]

{ #category : #'instance creation' }
TypNilType class >> named: aString [
	self shouldNotImplement
]

{ #category : #'instance creation' }
TypNilType class >> named: aString super: aType [
	self shouldNotImplement
]

{ #category : #converting }
TypNilType >> asNonNullable [

	^ TypUnknownType instance
]

{ #category : #converting }
TypNilType >> asNullable [

	^ self
]

{ #category : #converting }
TypNilType >> contravariant: aType [

	^ aType asNullable
]

{ #category : #converting }
TypNilType >> covariant: aType [
	^ aType asNullable
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
