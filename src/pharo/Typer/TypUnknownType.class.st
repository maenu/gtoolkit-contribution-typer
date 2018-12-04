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

{ #category : #accessing }
TypUnknownType >> asParametricType: someTypes [
	^ TypParametricType new
		type: self copy;
		nullable: nullable;
		parameters: {};
		yourself
]

{ #category : #accessing }
TypUnknownType >> asSourceString [
	^ '?'
]

{ #category : #accessing }
TypUnknownType >> canBeParametricType [
	^ true
]

{ #category : #accessing }
TypUnknownType >> hasSuperType [
	^ false
]

{ #category : #testing }
TypUnknownType >> isUnknown [
	^ true
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
