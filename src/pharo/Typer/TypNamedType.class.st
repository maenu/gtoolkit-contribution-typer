Class {
	#name : #TypNamedType,
	#superclass : #TypType,
	#instVars : [
		'name'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypNamedType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypNamedType".
					nullable = object nullable and: [ name = object name ] ] ]
]

{ #category : #accessing }
TypNamedType >> allSuperTypes [
	^ super allSuperTypes collect: #asNonParametricType
]

{ #category : #converting }
TypNamedType >> asClass [
	self assert: [ self hasClass ].
	(name endsWith: ' class')
		ifFalse: [ ^ name asClass ].
	^ (name copyFrom: 1 to: name size - ' class' size) asClass classSide
]

{ #category : #converting }
TypNamedType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	^ TypFunctionType new
		type: self;
		parameters: someTypes;
		result: aType;
		optionalParameters: aBoolean;
		yourself
]

{ #category : #converting }
TypNamedType >> asNonParametricType [
	<typTypeResultAs: 'TypNamedType'>
	^ self
]

{ #category : #converting }
TypNamedType >> asParametricType: someTypes [
	^ TypParametricType new
		type: self copy;
		nullable: nullable;
		parameters: someTypes;
		yourself
]

{ #category : #accessing }
TypNamedType >> asSourceString [
	^ super asSourceString , name asString
]

{ #category : #converting }
TypNamedType >> canBeFunctionType [
	^ true
]

{ #category : #converting }
TypNamedType >> canBeParametricType [
	^ true
]

{ #category : #'as yet unclassified' }
TypNamedType >> compatibleWith: aType [
	| superTypes |
	aType isUnknown
		ifTrue: [ ^ aType ].
	aType isNil
		ifTrue: [ ^ self asNullableType ].
	(aType isUnion or: [ aType isParametric ])
		ifTrue: [ ^ aType compatibleWith: self ].
	superTypes := self withAllSuperTypes.
	^ aType asNonParametricType withAllSuperTypes detect: [ :e | superTypes anySatisfy: [ :f | f isCompatibleWith: e ] ] ifNone: [ TypUnknownType instance ]
]

{ #category : #testing }
TypNamedType >> hasClass [
	| clazz_ |
	clazz_ := name.
	(clazz_ endsWith: ' class')
		ifTrue: [ clazz_ := name copyFrom: 1 to: name size - ' class' size ].
	clazz_ asClassInEnvironment: Smalltalk globals ifAbsent: [ ^ false ].
	^ true
]

{ #category : #'as yet unclassified' }
TypNamedType >> hasSuperType [
	^ nullable or: [ self hasClass and: [ self asClass superclass isNotNil ] ]
]

{ #category : #comparing }
TypNamedType >> hash [
	^ super hash bitXor: self name hash
]

{ #category : #initialization }
TypNamedType >> initialize [
	<typTypeVariable: 'name' as: 'String<Character>'>
	super initialize
]

{ #category : #accessing }
TypNamedType >> name [
	<typTypeResultAs: 'String<Character>'>
	^ name
]

{ #category : #accessing }
TypNamedType >> name: anObject [
	<typTypeArgument: 1 as: 'String<Character>'>
	name := anObject
]

{ #category : #printing }
TypNamedType >> printOn: aStream [
	super printOn: aStream.
	aStream << name asString
]

{ #category : #'as yet unclassified' }
TypNamedType >> superType [
	self assert: [ self hasSuperType ].
	(self hasClass not or: [ self asClass superclass isNil ])
		ifTrue: [ "must be nullable" ^ TypNilType instance ].
	^ self asClass superclass typAsType copy
		nullable: nullable;
		yourself
]
