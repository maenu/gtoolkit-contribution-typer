Class {
	#name : #TypUnknownType,
	#superclass : #TypType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypUnknownType class >> instance [
	<typTypeResultAs: 'TypUnknownType'>
	^ instance ifNil: [ instance := self basicNew initialize ]
]

{ #category : #'instance creation' }
TypUnknownType class >> new [
	self shouldNotImplement
]

{ #category : #comparing }
TypUnknownType >> > aType [
	^ self ~= aType
]

{ #category : #polymorphic }
TypUnknownType >> arguments [
	^ #()
]

{ #category : #converting }
TypUnknownType >> asNonNullable [
	^ self
]

{ #category : #'as yet unclassified' }
TypUnknownType >> canUnderstand: aSymbol [
	^ false
]

{ #category : #copying }
TypUnknownType >> copy [
	^ self
]

{ #category : #testing }
TypUnknownType >> isUnknown [
	^ true
]

{ #category : #'as yet unclassified' }
TypUnknownType >> lookupSelector: aSymbol [
	self shouldNotImplement
]

{ #category : #accessing }
TypUnknownType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << '?'
]

{ #category : #polymorphic }
TypUnknownType >> result [
	^ self
]
