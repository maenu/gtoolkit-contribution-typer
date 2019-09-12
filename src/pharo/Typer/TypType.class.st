Class {
	#name : #TypType,
	#superclass : #Object,
	#instVars : [
		'nullable'
	],
	#category : #'Typer-Core'
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
TypType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypType".
					self nullable = object nullable ] ]
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
TypType >> asClass [
	<typTypeResultAs: 'ClassDescription'>
	TypNoClassError signal
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
TypType >> asMethod [
	<typTypeResultAs: 'CompiledMethod<Integer>'>
	TypNoMethodError signal
]

{ #category : #converting }
TypType >> asNamedType [
	<typTypeResultAs: 'TypNamedType'>
	TypNoTypeError signal
]

{ #category : #converting }
TypType >> asNonNullableType [
	<typTypeResultAs: 'TypType'>
	^ nullable
		ifTrue: [ self copy
				nullable: false;
				yourself ]
		ifFalse: [ self ]
]

{ #category : #converting }
TypType >> asNullableType [
	<typTypeResultAs: 'TypType'>
	^ nullable
		ifTrue: [ self ]
		ifFalse: [ self copy
				nullable: true;
				yourself ]
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

{ #category : #testing }
TypType >> hasSuperType [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #comparing }
TypType >> hash [
	^ nullable hash
]

{ #category : #initialization }
TypType >> initialize [
	<typTypeVariable: 'nullable' as: 'Boolean'>
	super initialize.
	nullable := false
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

{ #category : #'as yet unclassified' }
TypType >> lookupMessage: aSymbol [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeResultAs: 'CompiledMethod<Integer>'>
	self representsClass
		ifFalse: [ TypNoMethodError signal ].
	^ (self asClass lookupSelector: aSymbol)
		ifNil: [ TypNoMethodError signal ]
]

{ #category : #accessing }
TypType >> nullable [
	<typTypeResultAs: 'Boolean'>
	^ nullable
]

{ #category : #accessing }
TypType >> nullable: anObject [
	<typTypeArgument: 1 as: 'Boolean'>
	nullable := anObject
]

{ #category : #printing }
TypType >> printOn: aStream [
	nullable
		ifTrue: [ aStream << '!' ]
]

{ #category : #testing }
TypType >> representsClass [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> representsMethod [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #accessing }
TypType >> superType [
	<typTypeResultAs: 'TypType'>
	TypNoTypeError signal
]

{ #category : #'as yet unclassified' }
TypType >> understandsMessage: aSymbol [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeResultAs: 'Boolean'>
	^ [ self lookupMessage: aSymbol.
	true ]
		on: TypNoMethodError
		do: [ false ]
]
