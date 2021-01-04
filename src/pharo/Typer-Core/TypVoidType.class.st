Class {
	#name : #TypVoidType,
	#superclass : #TypType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypVoidType class >> instance [
	<typTypeResultAs: 'TypVoidType'>
	^ instance ifNil: [ instance := self basicNew initialize ]
]

{ #category : #'instance creation' }
TypVoidType class >> new [
	self shouldNotImplement
]

{ #category : #comparing }
TypVoidType >> > aType [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
TypVoidType >> canUnderstand: aSymbol [
	^ false
]

{ #category : #copying }
TypVoidType >> copy [
	^ self
]

{ #category : #testing }
TypVoidType >> isVoid [
	^ true
]

{ #category : #'as yet unclassified' }
TypVoidType >> lookupSelector: aSymbol [
	self shouldNotImplement
]

{ #category : #printing }
TypVoidType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << 'void'
]
