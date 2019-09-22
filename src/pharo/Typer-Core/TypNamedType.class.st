Class {
	#name : #TypNamedType,
	#superclass : #TypType,
	#instVars : [
		'name',
		'representsClass',
		'clazz'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypNamedType class >> named: aString [
	^ self new
		name: aString;
		yourself
]

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
	^ self ~= aType and: [ (aType isNil and: [ nullable ]) or: [ aType isNamed and: [ self representsClassDescription and: [ aType representsClassDescription and: [ aType asClassDescription typIncludesBehavior: self asClassDescription ] ] ] ] ]
]

{ #category : #converting }
TypNamedType >> asClassDescription [
	self assert: [ self representsClassDescription ].
	^ clazz
		ifNil: [ clazz := (name endsWith: ' class')
				ifTrue: [ (name copyFrom: 1 to: name size - ' class' size) asClass classSide ]
				ifFalse: [ (name endsWith: ' classTrait')
						ifTrue: [ (name copyFrom: 1 to: name size - ' classTrait' size) asClass
								classSide ]
						ifFalse: [ name asClass ] ] ]
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
TypNamedType >> asNamedType [
	^ (TypNamedType named: name)
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

{ #category : #accessing }
TypNamedType >> clazz: aClassDescription [
	clazz := aClassDescription.
	representsClass := true
]

{ #category : #'as yet unclassified' }
TypNamedType >> hasSuperType [
	^ nullable or: [ self representsClassDescription and: [ self asClassDescription superclass isNotNil ] ]
]

{ #category : #comparing }
TypNamedType >> hash [
	^ super hash bitXor: name hash
]

{ #category : #initialization }
TypNamedType >> initialize [
	<typTypeVariable: 'name' as: 'String<Character>'>
	<typTypeVariable: 'representsClass' as: '!Boolean'>
	super initialize.
	representsClass := nil
]

{ #category : #testing }
TypNamedType >> isNamed [
	^ true
]

{ #category : #'as yet unclassified' }
TypNamedType >> lookupSelector: aSymbol [
	^ self representsClassDescription
		ifTrue: [ (self asClassDescription lookupSelector: aSymbol)
				ifNil: [ Set new ]
				ifNotNil: [ :e | Set with: e ] ]
		ifFalse: [ Set new ]
]

{ #category : #accessing }
TypNamedType >> name [
	<typTypeResultAs: 'String<Character>'>
	^ name
]

{ #category : #accessing }
TypNamedType >> name: anObject [
	<typTypeArgument: 1 as: 'String<Character>'>
	name := anObject.
	representsClass := nil
]

{ #category : #printing }
TypNamedType >> printOn: aStream [
	super printOn: aStream.
	aStream << name asString
]

{ #category : #testing }
TypNamedType >> representsClassDescription [
	self flag: 'FIXME invalidate?'.
	representsClass
		ifNil: [ | clazz_ |
			clazz_ := name.
			(clazz_ endsWith: ' class')
				ifTrue: [ clazz_ := name copyFrom: 1 to: name size - ' class' size ].
			(clazz_ endsWith: ' classTrait')
				ifTrue: [ clazz_ := name copyFrom: 1 to: name size - ' classTrait' size ].
			representsClass := true.
			[ clazz_ asClass ]
				on: NotFound
				do: [ representsClass := false ] ].
	^ representsClass
]

{ #category : #'as yet unclassified' }
TypNamedType >> superType [
	self assert: [ self hasSuperType ].
	(self representsClassDescription not or: [ self asClassDescription superclass isNil ])
		ifTrue: [ "must be nullable" ^ TypNilType instance ].
	^ self asClassDescription superclass typAsType copy
		nullable: nullable;
		yourself
]
