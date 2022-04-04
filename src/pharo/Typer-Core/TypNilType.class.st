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

{ #category : #initialization }
TypNilType >> initialize [
	super initialize.
	self initializeClassDescription: UndefinedObject
]

{ #category : #testing }
TypNilType >> isNil [
	^ true
]

{ #category : #converting }
TypNilType >> loosen: aType [

	^ aType asNullable
]

{ #category : #printing }
TypNilType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << '!'
]

{ #category : #converting }
TypNilType >> tighten: aType [

	^ aType asNullable
]
