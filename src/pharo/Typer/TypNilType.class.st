Class {
	#name : #TypNilType,
	#superclass : #TypType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypNilType class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypNilType >> hasSuperType [
	^ false
]

{ #category : #'as yet unclassified' }
TypNilType >> lookupMethodSelector: aSymbol [
	^ UndefinedObject lookupSelector: aSymbol
]

{ #category : #printing }
TypNilType >> printOn: aStream [
	aStream << 'nil'
]

{ #category : #accessing }
TypNilType >> superType [
	TypNoSuperTypeError signal
]
