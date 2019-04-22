Class {
	#name : #TypUnionType,
	#superclass : #TypType,
	#instVars : [
		'types'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypUnionType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypUnionType".
					self nullable = object nullable and: [ self types asSet = object types asSet ] ] ]
]

{ #category : #comparing }
TypUnionType >> > aType [
	^ self ~= aType
		and: [ aType isUnion
				ifTrue: [ (aType "typCastAs TypUnionType") types allSatisfy: [ :e | self >= e ] ]
				ifFalse: [ types anySatisfy: [ :e | e >= aType ] ] ]
]

{ #category : #converting }
TypUnionType >> asClass [
	^ self superType asClass
]

{ #category : #converting }
TypUnionType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	^ self superType asFunctionType: someTypes result: aType optionalParameters: aBoolean
]

{ #category : #converting }
TypUnionType >> asNamedType [
	^ self superType asNamedType
]

{ #category : #converting }
TypUnionType >> asParametricType: someTypes [
	^ self superType asParametricType: someTypes
]

{ #category : #accessing }
TypUnionType >> asTypeCompatibleWith: aType [
	| remains current |
	aType isUnknown
		ifTrue: [ ^ aType ].
	aType isNil
		ifTrue: [ ^ self asNullableType ].
	remains := types copy asOrderedCollection.
	remains remove: TypUnknownType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	remains := remains sort: [ :a :b | a >= b ].
	current := remains first.
	remains remove: current.
	[ remains isEmpty ]
		whileFalse: [ | next common |
			next := remains first.
			remains remove: next.
			common := current asTypeCompatibleWith: next.
			common isUnknown
				ifTrue: [ ^ common ].
			common = current
				ifFalse: [ current := common.
					current isUnion
						ifTrue: [ remains addAll: (current "typCastAs TypUnionType") types ]
						ifFalse: [ remains add: current ].
					remains := remains asSet asOrderedCollection sort: [ :a :b | a >= b ] ] ].
	nullable
		ifTrue: [ ^ current asNullableType ].
	^ current
]

{ #category : #testing }
TypUnionType >> hasParamatersCompatibleWithThoseOf: aType [
	<typTypeArgument: 1 as: 'TypFunctionType'>
	<typTypeResultAs: 'Boolean'>
	self assert: [ self isFunction ].
	^ (self superType "typCastAs TypFunctionType") hasParamatersCompatibleWithThoseOf: aType
]

{ #category : #testing }
TypUnionType >> hasSuperType [
	^ self superType ~= self
]

{ #category : #comparing }
TypUnionType >> hash [
	^ super hash bitXor: types hash
]

{ #category : #accessing }
TypUnionType >> initialize [
	<typTypeParametersAs: 'TypType'>
	<typTypeVariable: 'types' as: 'Set<TypType>'>
	super initialize.
	types := Set new "typParameters TypType"
]

{ #category : #converting }
TypUnionType >> isFunction [
	^ self superType isFunction
]

{ #category : #converting }
TypUnionType >> isNamed [
	^ self superType isNamed
]

{ #category : #converting }
TypUnionType >> isParametric [
	^ self hasSuperType and: [ self superType isParametric ]
]

{ #category : #testing }
TypUnionType >> isUnion [
	^ true
]

{ #category : #generated }
TypUnionType >> parameters [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	self assert: [ self isParametric ].
	^ (self superType "typCastAs TypParametricType") parameters
]

{ #category : #'as yet unclassified' }
TypUnionType >> postCopy [
	super postCopy.
	types := types collect: #copy
]

{ #category : #printing }
TypUnionType >> printOn: aStream [
	super printOn: aStream.
	types = {TypUnknownType instance} asSet
		ifTrue: [ aStream << '{?}'.
			^ self ].
	aStream << '{'
		<<
			((types includes: TypUnknownType instance)
				ifTrue: [ '?,' ]
				ifFalse: [ '' ]).
	(types copyWithout: TypUnknownType instance)
		ifNotEmpty: [ :e | 
			| superType |
			superType := (TypUnionType new
				types: e;
				yourself) superType.
			aStream << superType printString ].
	aStream << '}'
]

{ #category : #testing }
TypUnionType >> representsClass [
	^ self superType representsClass
]

{ #category : #accessing }
TypUnionType >> superType [
	| remains current |
	types ifEmpty: [ ^ TypUnknownType instance ].
	remains := types copy.
	current := remains anyOne.
	remains remove: current.
	[ remains isEmpty ]
		whileFalse: [ | next common |
			next := remains anyOne.
			remains remove: next.
			common := current asTypeCompatibleWith: next.
			common isUnknown
				ifTrue: [ ^ nullable
						ifTrue: [ common asNullableType ]
						ifFalse: [ common ] ].
			common = current
				ifFalse: [ current := common.
					remains add: current ] ].
	^ current
]

{ #category : #accessing }
TypUnionType >> types [
	<typTypeResultAs: 'Set<TypType>'>
	^ types
]

{ #category : #accessing }
TypUnionType >> types: anObject [
	<typTypeArgument: 1 as: 'Collection<TypType>'>
	types := anObject asSet
]
