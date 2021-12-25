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

{ #category : #converting }
TypNilType >> asCompatibleWith: aType [

	<typEdge>
	^ aType asNullable
]

{ #category : #converting }
TypNilType >> asNonNullable [

	<typEdge>
	^ TypUnknownType instance
]

{ #category : #converting }
TypNilType >> asNullable [

	<typEdge>
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
