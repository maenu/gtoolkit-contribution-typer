Class {
	#name : #TypUnknownType,
	#superclass : #TypNamedType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Core'
}

{ #category : #accessing }
TypUnknownType class >> classDescription: aClassDescription [
	self shouldNotImplement
]

{ #category : #accessing }
TypUnknownType class >> classDescription: aClassDescription super: aType [

	self shouldNotImplement
]

{ #category : #accessing }
TypUnknownType class >> instance [

	^ instance ifNil: [ instance := self new ]
]

{ #category : #invalidation }
TypUnknownType class >> invalidate [
	<script>
	super invalidate.
	instance := nil
]

{ #category : #accessing }
TypUnknownType class >> named: aString [
	self shouldNotImplement
]

{ #category : #accessing }
TypUnknownType class >> named: aString super: aType [
	self shouldNotImplement
]

{ #category : #comparing }
TypUnknownType >> > aType [
	^ aType isUnknown not
]

{ #category : #converting }
TypUnknownType >> contravariant: aType [

	^ self
]

{ #category : #accessing }
TypUnknownType >> initialize [
	super initialize.
	self initializeClassDescription: ProtoObject
]

{ #category : #testing }
TypUnknownType >> isUnknown [
	^ true
]

{ #category : #printing }
TypUnknownType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << '?'
]

{ #category : #compatibility }
TypUnknownType >> withParameters: aCollection [

	^ self
]

{ #category : #compatibility }
TypUnknownType >> withSuper: aType [

	^ self
]
