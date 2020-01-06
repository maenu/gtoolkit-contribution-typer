Class {
	#name : #TypNoType,
	#superclass : #TypType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypNoType class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #comparing }
TypNoType >> > aType [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
TypNoType >> canUnderstand: aSymbol [
	^ false
]

{ #category : #copying }
TypNoType >> copy [
	^ self
]

{ #category : #testing }
TypNoType >> isNoType [
	^ true
]

{ #category : #'as yet unclassified' }
TypNoType >> lookupSelector: aSymbol [
	self shouldNotImplement
]
