Class {
	#name : #TypType,
	#superclass : #Object,
	#instVars : [
		'superType'
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
TypType >> asNonNullableType [
	<typTypeResultAs: 'TypType'>
	^ self
]

{ #category : #converting }
TypType >> asNullableType [
	<typTypeResultAs: 'TypType'>
	^ {TypNilType instance.
	self} typAsType
]

{ #category : #'as yet unclassified' }
TypType >> canUnderstand: aSymbol [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeResultAs: 'Boolean'>
	^ [ self lookupSelector: aSymbol.
	true ]
		on: TypNoMethodError
		do: [ false ]
]

{ #category : #converting }
TypType >> classDescription [
	<typTypeResultAs: 'ClassDescription'>
	TypNoClassDescriptionError signal
]

{ #category : #testing }
TypType >> hasSuperType [
	<typTypeResultAs: 'Boolean'>
	^ superType isNotNil
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
TypType >> isParametric [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isTypeVariable [
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

{ #category : #'as yet unclassified' }
TypType >> lookupSelector: aSymbol [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeResultAs: 'Set<CompiledMethod<Integer>>'>
	TypNoMethodError signal
]

{ #category : #'as yet unclassified' }
TypType >> nullable [
	^ self isNil
]

{ #category : #copying }
TypType >> postCopy [
	super postCopy.
	superType := superType copy
]

{ #category : #testing }
TypType >> representsClassDescription [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #'as yet unclassified' }
TypType >> superType [
	<typTypeResultAs: 'TypType'>
	^ superType ifNil: [ TypNoTypeError signal ] ifNotNil: #yourself
]

{ #category : #'as yet unclassified' }
TypType >> superType: aType [
	superType := aType
]
