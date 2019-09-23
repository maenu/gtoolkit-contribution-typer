Class {
	#name : #TypType,
	#superclass : #Object,
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
TypType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	<typTypeArgument: 2 as: 'TypType'>
	<typTypeArgument: 3 as: 'Boolean'>
	<typTypeResultAs: 'TypFunctionType'>
	TypNoTypeError signal
]

{ #category : #converting }
TypType >> asNamedType [
	<typTypeResultAs: 'TypNamedType'>
	TypNoTypeError signal
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

{ #category : #converting }
TypType >> asParametricType: someTypes [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	<typTypeResultAs: 'TypParametricType'>
	TypNoTypeError signal
]

{ #category : #accessing }
TypType >> asTypeCompatibleWith: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	aType isUnknown
		ifTrue: [ ^ aType ].
	aType isNil
		ifTrue: [ ^ self asNullableType ].
	self >= aType
		ifTrue: [ ^ self ].
	self hasSuperType
		ifTrue: [ ^ self superType asTypeCompatibleWith: aType ].
	^ TypUnknownType instance
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
	^ false
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

{ #category : #testing }
TypType >> representsClassDescription [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #accessing }
TypType >> superType [
	<typTypeResultAs: 'TypType'>
	TypNoTypeError signal
]
