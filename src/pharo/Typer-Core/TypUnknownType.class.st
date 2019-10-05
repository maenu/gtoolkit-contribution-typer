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

{ #category : #'as yet unclassified' }
TypUnknownType >> canUnderstand: aSymbol [
	^ aSymbol implementors isNotEmpty
]

{ #category : #copying }
TypUnknownType >> copy [
	^ self
]

{ #category : #testing }
TypUnknownType >> hasSuperType [
	^ false
]

{ #category : #testing }
TypUnknownType >> isUnknown [
	^ true
]

{ #category : #'as yet unclassified' }
TypUnknownType >> lookupSelector: aSymbol [
	self assert: [ self canUnderstand: aSymbol ].
	^ aSymbol implementors asSet
]

{ #category : #accessing }
TypUnknownType >> printOn: aStream [
	aStream << '?'
]

{ #category : #'as yet unclassified' }
TypUnknownType >> superType [
	self shouldNotImplement
]
