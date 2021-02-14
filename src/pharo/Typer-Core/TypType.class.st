Class {
	#name : #TypType,
	#superclass : #Object,
	#instVars : [
		'superType',
		'origin'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #comparing }
TypType >> < aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ aType > self
]

{ #category : #comparing }
TypType >> <= aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ aType >= self
]

{ #category : #comparing }
TypType >> > aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	self subclassResponsibility
]

{ #category : #comparing }
TypType >> >= aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ self = aType or: [ self > aType ]
]

{ #category : #converting }
TypType >> asCompatibleWith: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	aType isVariable
		ifTrue: [ ^ aType ].
	aType isUnknown
		ifTrue: [ ^ aType ].
	aType isNil
		ifTrue: [ ^ self asNullable ].
	self >= aType
		ifTrue: [ ^ self ].
	self hasSuperType
		ifTrue: [ ^ self superType asCompatibleWith: aType ].
	^ TypUnknownType new
]

{ #category : #converting }
TypType >> asNonNullable [
	<typTypeResultAs: 'TypType'>
	^ self
]

{ #category : #converting }
TypType >> asNullable [
	<typTypeResultAs: 'TypType'>
	^ {TypNilType new.
	self} typAsType
]

{ #category : #testing }
TypType >> hasSuperType [
	^ superType isNotNil
]

{ #category : #initialization }
TypType >> initialize [
	<typTypeVariable: 'superType' as: '{!,TypType}'>
	super initialize.
	origin := TypNilOrigin instance
]

{ #category : #testing }
TypType >> isFunction [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNamed [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNil [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNullable [
	^ self isNil
]

{ #category : #testing }
TypType >> isParametric [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isUnion [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isUnknown [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isVariable [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #accessing }
TypType >> origin [
	^ origin
]

{ #category : #accessing }
TypType >> origin: anOrigin [
	origin := anOrigin
]

{ #category : #printing }
TypType >> printOn: aStream [
	self printOn: aStream skipping: IdentitySet new
]

{ #category : #printing }
TypType >> printOn: aStream skipping: anIdentitySet [
	"Respects skipping set to not print recursive type infinitely."

	self subclassResponsibility
]

{ #category : #accessing }
TypType >> superType [
	<typTypeResultAs: 'TypType'>
	self assert: [ self hasSuperType ].
	^ superType "typCastAs TypType"
]

{ #category : #accessing }
TypType >> superType: aType [
	<typTypeArgument: 1 as: 'TypType'>
	superType := aType
]
