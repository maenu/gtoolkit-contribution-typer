Class {
	#name : #TypNamedType,
	#superclass : #TypType,
	#instVars : [
		'name',
		'classDescription',
		'hasClassDescription'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypNamedType class >> classDescription: aClassDescription [

	<typPraArguments: 'ClassDescription'>
	| instance |
	instance := self new
		            initializeClassDescription: aClassDescription;
		            yourself.
	^ self index
		  at: { 
				  aClassDescription name.
				  instance superOrNil }
		  ifAbsentPut: [ instance ]
]

{ #category : #'instance creation' }
TypNamedType class >> classDescription: aClassDescription super: aType [

	<typPraArguments: 'ClassDescription'>
	^ self index
		  at: { 
				  aClassDescription name.
				  aType }
		  ifAbsentPut: [ 
			  self new
				  initializeClassDescription: aClassDescription;
				  initializeSuper: aType;
				  yourself ]
]

{ #category : #'instance creation' }
TypNamedType class >> named: aString [

	<typPraArguments: 'String'>
	| instance |
	instance := self new
		            initializeName: aString asString;
		            yourself.
	^ self index
		  at: { 
				  aString asString.
				  instance superOrNil }
		  ifAbsentPut: [ instance ]
]

{ #category : #'as yet unclassified' }
TypNamedType class >> named: aString super: aType [

	<typPraArguments: 'String'>
	^ self index
		  at: { 
				  aString asString.
				  aType }
		  ifAbsentPut: [ 
			  self new
				  initializeName: aString asString;
				  initializeSuper: aType;
				  yourself ]
]

{ #category : #comparing }
TypNamedType >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
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

{ #category : #polymorphic }
TypNamedType >> at: aString [

	^ self hasSuper
		  ifTrue: [ self super at: aString ]
		  ifFalse: [ TypUnknownType instance ]
]

{ #category : #accessing }
TypNamedType >> classDescription [
	<typPraResult: 'ClassDescription'>
	self assert: [ self hasClassDescription ].
	^ classDescription
]

{ #category : #testing }
TypNamedType >> hasClassDescription [
	<typPraResult: 'Boolean'>
	^ hasClassDescription
		ifNil: [ hasClassDescription := [ classDescription := (Character space
				split: name) first asClass.
			true ]
				on: NotFound
				do: [ false ] ]
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

	<typPraArguments: 'ClassDescription'>
	classDescription := aClassDescription.
	name := classDescription name.
	hasClassDescription := true.
	hash := nil
]

{ #category : #initialization }
TypNamedType >> initializeName: anObject [

	<typPraArguments: 'String'>
	classDescription := nil.
	name := anObject.
	hasClassDescription := nil.
	hash := nil
]

{ #category : #invalidation }
TypNamedType >> invalidateOnClassChange: aClassAnnouncement [

	self hasClassDescription ifFalse: [ ^ false ].
	(self classDescription = aClassAnnouncement classAffected or: [ 
		 self classDescription inheritsFrom:
			 aClassAnnouncement classAffected ]) ifFalse: [ ^ false ].
	^ true
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

{ #category : #polymorphic }
TypNamedType >> parameters [
	^ self super parameters
]

{ #category : #printing }
TypNamedType >> printOn: aStream skipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ 
		aStream << '.'.
		^ self ].
	aStream << name asString
]

{ #category : #polymorphic }
TypNamedType >> result [

	self hasSuper ifFalse: [ ^ TypUnknownType instance ].
	^ self super result
]

{ #category : #accessing }
TypNamedType >> super [
	self assert: [ self hasSuper ].
	^ superType
		ifNil: [ superType := classDescription superclass typAsType ]
]

{ #category : #polymorphic }
TypNamedType >> withAt: aString put: aType [

	^ self withSuper: (self super withAt: aString put: aType)
]

{ #category : #polymorphic }
TypNamedType >> withParameters: aCollection [

	self hasSuper ifFalse: [ ^ self ].
	^ self withSuper: (self super withParameters: aCollection)
]

{ #category : #converting }
TypNamedType >> withSuper: aType [

	self hasClassDescription ifTrue: [ 
		^ self class classDescription: self classDescription super: aType ].
	^ self class named: name super: aType
]
