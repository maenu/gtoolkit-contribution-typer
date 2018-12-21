Class {
	#name : #TypUnknownType,
	#superclass : #TypType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypUnknownType class >> instance [
	<typTypeResultAs: 'TypUnknownType'>
	^ instance ifNil: [ instance := self new ]
]

{ #category : #converting }
TypUnknownType >> asClass [
	TypNoClassError signal
]

{ #category : #converting }
TypUnknownType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	TypNoTypeError signal
]

{ #category : #converting }
TypUnknownType >> asNonParametricType [
	<typTypeResultAs: 'TypNamedType'>
	^ TypUnknownType instance
]

{ #category : #converting }
TypUnknownType >> asNullableType [
	^ {self.
	TypNilType instance} typAsType
]

{ #category : #converting }
TypUnknownType >> asParametricType: someTypes [
	TypNoTypeError signal
]

{ #category : #accessing }
TypUnknownType >> asSourceString [
	^ '?'
]

{ #category : #'as yet unclassified' }
TypUnknownType >> compatibleWith: aType [
	aType isNil
		ifTrue: [ ^ {self.
			aType} typAsType ].
	^ self
]

{ #category : #copying }
TypUnknownType >> copy [
	^ self
]

{ #category : #accessing }
TypUnknownType >> hasSuperType [
	^ false
]

{ #category : #comparing }
TypUnknownType >> isCompatibleWith: aType [
	^ true
]

{ #category : #testing }
TypUnknownType >> isUnknown [
	^ true
]

{ #category : #accessing }
TypUnknownType >> nullable: anObject [
	"do nothing"

	
]

{ #category : #generated }
TypUnknownType >> parameters [
	self flag: 'this is very hackish'.
	^ {self.
	self.
	self}
]

{ #category : #accessing }
TypUnknownType >> printOn: aStream [
	super printOn: aStream.
	aStream << '?'
]

{ #category : #accessing }
TypUnknownType >> superType [
	TypNoSuperTypeError signal
]
