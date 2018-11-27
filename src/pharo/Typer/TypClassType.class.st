Class {
	#name : #TypClassType,
	#superclass : #TypType,
	#instVars : [
		'clazz'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypClassType >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ nullable = anObject nullable and: [ clazz = anObject clazz ] ] ]
]

{ #category : #converting }
TypClassType >> asClass [
	(clazz endsWith: ' class')
		ifFalse: [ ^ clazz asClass ].
	^ (clazz copyFrom: 1 to: clazz size - ' class' size) asClass classSide
]

{ #category : #converting }
TypClassType >> asParametricType: someTypes [
	^ TypParametricType new
		nullable: nullable;
		type: self;
		parameters: someTypes;
		yourself
]

{ #category : #converting }
TypClassType >> canBeParametricType [
	^ true
]

{ #category : #accessing }
TypClassType >> clazz [
	^ clazz
]

{ #category : #accessing }
TypClassType >> clazz: anObject [
	clazz := anObject
]

{ #category : #testing }
TypClassType >> hasClass [
	| clazz_ |
	clazz_ := clazz.
	(clazz_ endsWith: ' class')
		ifTrue: [ clazz_ := clazz copyFrom: 1 to: clazz size - ' class' size ].
	clazz_ asClassInEnvironment: Smalltalk globals ifAbsent: [ ^ false ].
	^ true
]

{ #category : #'as yet unclassified' }
TypClassType >> hasSuperType [
	^ self asClass superclass isNotNil or: [ nullable ]
]

{ #category : #comparing }
TypClassType >> hash [
	^ super hash bitXor: self clazz hash
]

{ #category : #printing }
TypClassType >> printOn: aStream [
	super printOn: aStream.
	aStream << clazz asString
]

{ #category : #'as yet unclassified' }
TypClassType >> superType [
	^ self asClass superclass
		ifNil: [ nullable
				ifTrue: [ TypNilType instance ]
				ifFalse: [ TypNoSuperTypeError signal ] ]
		ifNotNil: #typAsType
]
