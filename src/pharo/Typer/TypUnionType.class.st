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
					nullable = object nullable and: [ types = object types ] ] ]
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
	<typTypeResultAs: 'TypNamedType'>
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
	self assert: [ (self isParametric) and: [ self superType isParametric ] ].
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
	aStream << 'U'
		<<
			((types includes: TypUnknownType instance)
				ifTrue: [ TypUnknownType instance printString ]
				ifFalse: [ '' ]) << ' '
		<<
			(self superType isUnion
				ifTrue: [ '...' ]
				ifFalse: [ self superType printString ])
]

{ #category : #accessing }
TypUnionType >> superType [
	| remains nullable_ current |
	remains := types copy asOrderedCollection.
	nullable_ := remains includes: TypNilType instance.
	remains remove: TypNilType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypNilType instance ].
	remains remove: TypUnknownType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	remains := remains sort: [ :a :b | a >= b ].
	current := remains first.
	remains remove: current.
	[ remains isEmpty ]
		whileFalse: [ | next common |
			next := remains first.
			remains remove: next.
			common := current withAllSuperTypes
				detect: [ :e | e >= next ]
				ifNone: [ ^ TypUnknownType instance ].
				self flag: 'parametric types supertypes are multidimensional...'.
			common = current
				ifFalse: [ current := common.
					remains add: current.
					remains := remains asSet asOrderedCollection sort: [ :a :b | a >= b ] ] ].
	nullable_
		ifTrue: [ current := current copy.
			current nullable: true ].
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
