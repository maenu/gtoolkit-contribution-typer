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
	^ index at: aClassDescription ifAbsentPut: [ 
		  self new
			  initializeClassDescription: aClassDescription;
			  yourself ]
]

{ #category : #'instance creation' }
TypNamedType class >> named: aString [

	<typPraArguments: 'String'>
	^ index at: aString ifAbsentPut: [ 
		  self new
			  initializeName: aString;
			  yourself ]
]

{ #category : #accessing }
TypNamedType class >> newFrom: aType [
	self assert: [ aType isKindOf: self ].
	^ self named: aType name
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

	<typEdge>
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

	<typEdge>
	^ self withSuper: (self super withAt: aString put: aType)
]

{ #category : #polymorphic }
TypNamedType >> withParameters: aCollection [

	<typEdge>
	| copy |
	self flag: 'TODO should use index lookup, not copy'.
	copy := self copy.
	copy hasSuper ifTrue: [ 
		copy initializeSuperType: (copy super withParameters: aCollection) ].
	^ copy
]
