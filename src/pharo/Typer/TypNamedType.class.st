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
				and: [ | type |
					type := anObject "typCastAs TypNamedType".
					self nullable = type nullable and: [ self name = type name ] ] ]
]

{ #category : #comparing }
TypNamedType >> > aType [
	^ self ~= aType and: [ aType isNamed and: [ self representsClass and: [ aType representsClass and: [ aType asClass inheritsFrom: self asClass ] ] ] ]
]

{ #category : #converting }
TypNamedType >> asClass [
	self assert: [ self representsClass ].
	(name endsWith: ' class')
		ifFalse: [ ^ name asClass ].
	^ (name copyFrom: 1 to: name size - ' class' size) asClass classSide
]

{ #category : #converting }
TypNamedType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	^ TypFunctionType new
		name: name;
		parameters: someTypes;
		result: aType;
		optionalParameters: aBoolean;
		yourself
]

{ #category : #converting }
TypNamedType >> asMethod [
	| parts clazz selector |
	self assert: [ self representsMethod ].
	parts := '>>#' split: name.
	clazz := ((parts at: 1) endsWith: ' class')
		ifTrue: [ ((parts at: 1) copyFrom: 1 to: (parts at: 1) size - ' class' size) asClass classSide ]
		ifFalse: [ (parts at: 1) asClass ].
	selector := (parts at: 2) asSymbol.
	self flag: 'should it do a lookup?'.
	^ clazz >> selector
]

{ #category : #converting }
TypNamedType >> asNamedType [
	^ TypNamedType new
		name: name;
		nullable: nullable;
		yourself
]

{ #category : #converting }
TypNamedType >> asParametricType: someTypes [
	^ TypParametricType new
		name: name;
		nullable: nullable;
		parameters: someTypes;
		yourself
]

{ #category : #'as yet unclassified' }
TypNamedType >> hasSuperType [
	^ nullable or: [ self representsClass and: [ self asClass superclass isNotNil ] ]
]

{ #category : #comparing }
TypNamedType >> hash [
	^ super hash bitXor: name hash
]

{ #category : #initialization }
TypNamedType >> initialize [
	<typTypeVariable: 'name' as: 'String<Character>'>
	super initialize
]

{ #category : #testing }
TypNamedType >> isNamed [
	^ true
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

{ #category : #testing }
TypNamedType >> representsClass [
	| clazz_ |
	clazz_ := name.
	(clazz_ endsWith: ' class')
		ifTrue: [ clazz_ := name copyFrom: 1 to: name size - ' class' size ].
	clazz_ asClassInEnvironment: Smalltalk globals ifAbsent: [ ^ false ].
	^ true
]

{ #category : #testing }
TypNamedType >> representsMethod [
	^ name includesSubstring: '>>#'
]

{ #category : #'as yet unclassified' }
TypNamedType >> superType [
	self assert: [ self hasSuperType ].
	(self representsClass not or: [ self asClass superclass isNil ])
		ifTrue: [ "must be nullable" ^ TypNilType instance ].
	^ self asClass superclass typAsType copy
		nullable: nullable;
		yourself
]
