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
	^ self == anObject or: [ self class = anObject class and: [ nullable = anObject nullable and: [ name = anObject name ] ] ]
]

{ #category : #converting }
TypNamedType >> asClass [
	(name endsWith: ' class')
		ifFalse: [ ^ name asClass ].
	^ (name copyFrom: 1 to: name size - ' class' size) asClass classSide
]

{ #category : #converting }
TypNamedType >> asParametricType: someTypes [
	^ TypParametricType new
		type: self copy;
		nullable: nullable;
		parameters: someTypes;
		yourself
]

{ #category : #converting }
TypNamedType >> canBeParametricType [
	^ true
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
	<typTypeVariable: 'name' as: 'String'>
	super initialize
]

{ #category : #accessing }
TypNamedType >> name [
	<typTypeResultAs: 'String'>
	^ name
]

{ #category : #accessing }
TypNamedType >> name: anObject [
	<typTypeArgument: 1 as: 'String'>
	name := anObject
]

{ #category : #printing }
TypNamedType >> printOn: aStream [
	super printOn: aStream.
	aStream << name asString
]

{ #category : #'as yet unclassified' }
TypNamedType >> superType [
	^ self asClass superclass
		ifNil: [ nullable
				ifTrue: [ TypNilType instance ]
				ifFalse: [ TypNoSuperTypeError signal ] ]
		ifNotNil: #typAsType
]
