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
				ifFalse: [ (types anySatisfy: [ :e | e >= aType ]) or: [ super > aType ] ] ]
]

{ #category : #converting }
TypUnionType >> asClass [
	^ self superType asClass
]

{ #category : #accessing }
TypUnionType >> asCompatibleType: aType [
	| remains nullable_ current |
	aType isUnknown
		ifTrue: [ ^ aType ].
	aType isNil
		ifTrue: [ ^ self asNullableType ].
	remains := types copy asOrderedCollection.
	nullable_ := remains includes: TypNilType instance.
	remains remove: TypNilType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ aType asNullableType ].
	remains remove: TypUnknownType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	remains := remains sort: [ :a :b | a >= b ].
	current := remains first.
	remains remove: current.
	[ remains isEmpty ]
		whileFalse: [ | next common |
			next := remains first.
			remains remove: next.
			common := current asCompatibleType: next.
			common isUnknown
				ifTrue: [ ^ common ].
			common = current
				ifFalse: [ current := common.
					current isUnion
						ifTrue: [ remains addAll: (current "typCastAs TypUnionType") types ]
						ifFalse: [ remains add: current ].
					remains := remains asSet asOrderedCollection sort: [ :a :b | a >= b ] ] ].
	nullable_
		ifTrue: [ ^ current asNullableType ].
	^ current
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

{ #category : #testing }
TypUnionType >> hasClass [
	^ self superType hasClass
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
	types := Set new
]

{ #category : #converting }
TypUnionType >> isFunction [
	^ self superType isFunction
]

{ #category : #converting }
TypUnionType >> isParametric [
	^ self superType isParametric
]

{ #category : #testing }
TypUnionType >> isUnion [
	^ true
]

{ #category : #accessing }
TypUnionType >> nullable [
	^ types includes: TypNilType instance
]

{ #category : #accessing }
TypUnionType >> nullable: aBoolean [
	aBoolean
		ifTrue: [ types add: TypNilType instance ]
		ifFalse: [ types remove: TypNilType instance ifAbsent: [  ] ]
]

{ #category : #generated }
TypUnionType >> parameters [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	self assert: [ self isParametric ].
	^ (self superType "typCastAs TypUnionType") parameters
]

{ #category : #'as yet unclassified' }
TypUnionType >> postCopy [
	super postCopy.
	types := types collect: #copy
]

{ #category : #printing }
TypUnionType >> printOn: aStream [
	types
		=
			{TypNilType instance.
			TypUnknownType instance} asSet
		ifTrue: [ aStream << '{!,?}'.
			^ self ].
	aStream << '{'
		<<
			((types includes: TypNilType instance)
				ifTrue: [ '!,' ]
				ifFalse: [ '' ])
		<<
			((types includes: TypUnknownType instance)
				ifTrue: [ '?,' ]
				ifFalse: [ '' ]).
	(types
		copyWithoutAll:
			{TypUnknownType instance.
			TypNilType instance})
		ifNotEmpty: [ :e | 
			| superType |
			superType := (TypUnionType new
				types: e;
				yourself) superType.
			aStream << superType printString ].
	aStream << '}'
]

{ #category : #accessing }
TypUnionType >> superType [
	| remains current |
	remains := types copy.
	current := remains anyOne.
	remains remove: current.
	[ remains isEmpty ]
		whileFalse: [ | next common |
			next := remains anyOne.
			remains remove: next.
			common := current asCompatibleType: next.
			common isUnknown
				ifTrue: [ ^ (remains includes: TypNilType instance)
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
