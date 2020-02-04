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
	^ instance ifNil: [ instance := self new ]
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
TypVoidType >> isVoidType [
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
