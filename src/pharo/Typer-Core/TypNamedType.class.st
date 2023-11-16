Class {
	#name : #TypNamedType,
	#superclass : #TypType,
	#instVars : [
		'name',
		'classDescription',
		'hasClassDescription'
	],
	#category : #'Typer-Core-Core'
}

{ #category : #'instance creation' }
TypNamedType class >> classDescription: aClassDescription [
	^ self index
		typAt: {aClassDescription name asSymbol.
				nil}
		ifAbsentPut: [ | instance |
			instance := self new
					initializeClassDescription: aClassDescription;
					yourself.
			instance superOrNil
				ifNotNil: [ :t | 
					self index
						typAt: {aClassDescription name asSymbol.
								t}
						put: instance ].
			instance ]
]

{ #category : #'instance creation' }
TypNamedType class >> classDescription: aClassDescription super: aType [
	^ self index
		typAt: {aClassDescription name asSymbol.
				aType}
		ifAbsentPut: [ self new
				initializeClassDescription: aClassDescription;
				initializeSuper: aType;
				yourself ]
]

{ #category : #'instance creation' }
TypNamedType class >> named: aSymbol [
	^ self index
		typAt: {aSymbol asSymbol.
				nil}
		ifAbsentPut: [ | instance |
			instance := self new
					initializeName: aSymbol asSymbol;
					yourself.
			instance superOrNil
				ifNotNil: [ :t | 
					self index
						typAt: {aSymbol asSymbol.
								t}
						put: instance ].
			instance ]
]

{ #category : #accessing }
TypNamedType class >> named: aSymbol super: aType [
	^ self index
		typAt: {aSymbol asSymbol.
				aType}
		ifAbsentPut: [ self new
				initializeName: aSymbol asSymbol;
				initializeSuper: aType;
				yourself ]
]

{ #category : #comparing }
TypNamedType >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #comparing }
TypNamedType >> > aType [
	aType = self
		ifTrue: [ ^ false ].
	(aType class inheritsFrom: self class)
		ifTrue: [ ^ self >= (aType as: self class) ].
	(aType isNamed
		and: [ self hasClassDescription and: [ aType hasClassDescription ] ])
		ifFalse: [ ^ super > aType ].
	aType classDescription = self classDescription
		ifFalse: [ ^ aType classDescription inheritsFrom: self classDescription ].
	(self hasSuper and: [ aType hasSuper ])
		ifFalse: [ ^ false ].
	^ self super > aType super
]

{ #category : #accessing }
TypNamedType >> allSelectors [
	self hasClassDescription ifFalse: [ ^ #() ].
	^ classDescription allSelectors
]

{ #category : #accessing }
TypNamedType >> classDescription [
	<typPraResult: 'ClassDescription'>
	self assert: [ self hasClassDescription ].
	^ classDescription
]

{ #category : #invalidation }
TypNamedType >> dependsOnClassDescription: aClassDescription [
	(super dependsOnClassDescription: aClassDescription) ifTrue: [ ^ true ].
	self hasClassDescription ifFalse: [ ^ false ].
	^ aClassDescription typDependsOnClassDescription: self classDescription
]

{ #category : #testing }
TypNamedType >> hasClassDescription [
	<typPraResult: 'Boolean'>
	^ hasClassDescription
		ifNil: [ hasClassDescription := [ | parts |
				parts := Character space split: name.
				classDescription := parts first asClass.
				(parts size = 2 and: [ parts second = 'class' ])
					ifTrue: [ classDescription := classDescription class ].
				true ] on: NotFound do: [ false ] ]
]

{ #category : #testing }
TypNamedType >> hasSuper [
	^ superType isNotNil
		or: [ self hasClassDescription
				and: [ self classDescription superclass isNotNil ] ]
]

{ #category : #comparing }
TypNamedType >> hashSkipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ ^ 31 ].
	^ (31 bitXor: name hash) bitXor: (super hashSkipping: anIdentitySet)
]

{ #category : #initialization }
TypNamedType >> initialize [
	<typPraVariable: 'name' as: 'String'>
	<typPraVariable: 'classDescription' as: '{!,ClassDescription}'>
	<typPraVariable: 'hasClassDescription' as: '{!,Boolean}'>
	super initialize
]

{ #category : #initialization }
TypNamedType >> initializeClassDescription: aClassDescription [
	self initializeName: aClassDescription name asSymbol.
	classDescription := aClassDescription
]

{ #category : #initialization }
TypNamedType >> initializeName: aSymbol [
	self assert: [ aSymbol isKindOf: Symbol ].
	classDescription := nil.
	name := aSymbol.
	hasClassDescription := nil.
	hash := nil
]

{ #category : #testing }
TypNamedType >> isNamed [
	^ true
]

{ #category : #accessing }
TypNamedType >> name [
	<typPraResult: 'String'>
	^ name
]

{ #category : #accessing }
TypNamedType >> overriders: aSymbol [
	^ (self classDescription lookupSelector: aSymbol)
		ifNil: [ #() ]
		ifNotNil: [ :m | 
			(TypInfIndex instance overriders: m)
				select: [ :mm | mm methodClass inheritsFrom: self classDescription ] ]
]

{ #category : #printing }
TypNamedType >> printOn: aStream skipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ 
		aStream << '.'.
		^ self ].
	aStream << name asString
]

{ #category : #accessing }
TypNamedType >> super [
	self assert: [ self hasSuper ].
	^ superType
		ifNil: [ superType := classDescription superclass typAsType ]
]

{ #category : #converting }
TypNamedType >> withSuper: aType [

	self hasClassDescription ifTrue: [ 
		^ self class classDescription: self classDescription super: aType ].
	^ self class named: name super: aType
]

{ #category : #accessing }
TypNamedType >> writers: aVariable [
	^ (TypInfIndex instance writers: aVariable)
		select: [ :m | m methodClass typAsType >= self ]
]
