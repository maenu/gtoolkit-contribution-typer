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
	^ instance ifNil: [ instance := self new ]
]

{ #category : #comparing }
TypUnknownType >> > aType [
	^ self ~= aType
]

{ #category : #converting }
TypUnknownType >> asNonNullableType [
	^ self
]

{ #category : #converting }
TypUnknownType >> asNullableType [
	^ TypUnionType new
		nullable: true;
		types: {self};
		yourself
]

{ #category : #'as yet unclassified' }
TypUnknownType >> asTypeCompatibleWith: aType [
	aType isNil
		ifTrue: [ ^ self asNullableType ].
	^ self
]

{ #category : #'as yet unclassified' }
TypUnknownType >> canUnderstand: aSymbol [
	^ true
]

{ #category : #copying }
TypUnknownType >> copy [
	^ self
]

{ #category : #testing }
TypUnknownType >> isUnknown [
	^ true
]

{ #category : #accessing }
TypUnknownType >> nullable: anObject [
	"do nothing"

	
]

{ #category : #accessing }
TypUnknownType >> printOn: aStream [
	aStream << '?'
]
