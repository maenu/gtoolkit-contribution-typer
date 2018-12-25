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
					self nullable = object nullable and: [ types = object types ] ] ]
]

{ #category : #converting }
TypUnionType >> asClass [
	^ self superType asClass
]

{ #category : #converting }
TypUnionType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	| type |
	type := self copy.
	type types
		removeAll;
		addAll:
			(types
				collect: [ :e | 
					e canBeFunctionType
						ifTrue: [ e asFunctionType: someTypes result: aType optionalParameters: aBoolean ]
						ifFalse: [ e ] ]).
	^ type
]

{ #category : #converting }
TypUnionType >> asNonParametricType [
	^ self superType asNonParametricType
]

{ #category : #converting }
TypUnionType >> asParametricType: someTypes [
	| type |
	type := self copy.
	type types
		removeAll;
		addAll:
			(types
				collect: [ :e | 
					e canBeParametricType
						ifTrue: [ e asParametricType: someTypes ]
						ifFalse: [ e ] ]).
	^ type
]

{ #category : #accessing }
TypUnionType >> asSourceString [
	^ super asSourceString , self superType asSourceString
]

{ #category : #converting }
TypUnionType >> canBeFunctionType [
	^ types anySatisfy: #canBeFunctionType
]

{ #category : #converting }
TypUnionType >> canBeParametricType [
	^ types anySatisfy: #canBeParametricType
]

{ #category : #accessing }
TypUnionType >> compatibleWith: aType [
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
			common := current compatibleWith: next.
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

{ #category : #comparing }
TypUnionType >> isCompatibleWith: aType [
	^ aType isUnion
		ifTrue: [ (aType "typCastAs TypUnionType") types allSatisfy: [ :e | self >= e ] ]
		ifFalse: [ (types anySatisfy: [ :e | e >= aType ]) or: [ super isCompatibleWith: aType ] ]
]

{ #category : #converting }
TypUnionType >> isParametric [
	^ types allSatisfy: #isParametric
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
	self
		assert: [ self isParametric and: [ self superType isParametric ] ].
	^ (self superType "typCastAs TypUnionType") parameters
]

{ #category : #'as yet unclassified' }
TypUnionType >> postCopy [
	super postCopy.
	types := types collect: #copy
]

{ #category : #printing }
TypUnionType >> printOn: aStream [
	super printOn: aStream.
	aStream << 'U'
		<<
			((types includes: TypNilType instance)
				ifTrue: [ '!' ]
				ifFalse: [ '' ])
		<<
			((types includes: TypUnknownType instance)
				ifTrue: [ '?' ]
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
			aStream << ' '
				<<
					(superType isUnion
						ifTrue: [ '...' ]
						ifFalse: [ superType printString ]) ]
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
			common := current compatibleWith: next.
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
	<typTypeArgument: 1 as: 'Set<TypType>'>
	types := anObject
]
