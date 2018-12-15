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
	^ self == anObject or: [ self class = anObject class and: [ nullable = anObject nullable and: [ types = anObject types ] ] ]
]

{ #category : #converting }
TypUnionType >> asClass [
	^ self superType asClass
]

{ #category : #converting }
TypUnionType >> asFunctionType: someTypes result: aType [
	| type |
	type := self copy.
	type types
		removeAll;
		addAll:
			(types
				collect: [ :e | 
					e canBeFunctionType
						ifTrue: [ e asFunctionType: someTypes result: aType ]
						ifFalse: [ e ] ]).
	^ type
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

{ #category : #accessing }
TypUnionType >> asType [
	<typTypeResultAs: 'TypType'>
	| remains current nullable_ |
	(types includesKey: TypUnknownType instance)
		ifTrue: [ ^ self ].
	remains := types copy.
	nullable_ := remains includes: TypNilType instance.
	remains remove: TypNilType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypNilType instance ].
	remains size = 1
		ifTrue: [ current := remains anyOne.
			nullable_
				ifTrue: [ current := current copy.
					current nullable: true ].
			^ current ].
	^ self
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
	^ self hasSuperType and: [ self superType hasClass ]
]

{ #category : #comparing }
TypUnionType >> hash [
	^ super hash bitXor: types keys hash
]

{ #category : #accessing }
TypUnionType >> initialize [
	<typTypeParametersAs: 'TypType'>
	<typTypeVariable: 'types' as: 'Set<TypType>'>
	super initialize.
	types := Set new
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

{ #category : #'as yet unclassified' }
TypUnionType >> postCopy [
	super postCopy.
	types := types copy
]

{ #category : #printing }
TypUnionType >> printOn: aStream [
	super printOn: aStream.
	aStream << 'U ' << self superType printString
]

{ #category : #accessing }
TypUnionType >> superType [
	| remains nullable_ current |
	self assert: [ self hasSuperType ].
	remains := types copy.
	remains remove: TypUnknownType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	nullable_ := remains includes: TypNilType instance.
	remains remove: TypNilType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypNilType instance ].
	current := remains anyOne.
	remains remove: current.
	[ remains isEmpty ]
		whileFalse: [ | next common |
			next := remains anyOne.
			remains remove: next.
			common := current withAllSuperTypes detect: [ :e | next <= e ].
			common == current
				ifFalse: [ current := common.
					remains add: current ] ].
	nullable_
		ifTrue: [ current := current copy.
			current nullable: true ].
	^ current
]

{ #category : #accessing }
TypUnionType >> types [
	^ types
]

{ #category : #accessing }
TypUnionType >> types: anObject [
	types := anObject
]
