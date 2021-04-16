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
	^ self new
		initializeClassDescription: aClassDescription;
		yourself
]

{ #category : #'instance creation' }
TypNamedType class >> named: aString [
	<typPraArguments: 'String'>
	^ self new
		initializeName: aString;
		yourself
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

{ #category : #accessing }
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
	(self hasSuperType and: [ aType hasSuperType ])
		ifFalse: [ ^ false ].
	^ self superType > aType superType
]

{ #category : #polymorphic }
TypNamedType >> at: aString [
	^ self superType at: aString
]

{ #category : #polymorphic }
TypNamedType >> at: aString ifAbsent: aBlock [
	self hasSuperType
		ifFalse: [ ^ aBlock value ].
	^ self superType at: aString ifAbsent: aBlock
]

{ #category : #polymorphic }
TypNamedType >> at: aString put: aType [
	^ self superType at: aString put: aType
]

{ #category : #converting }
TypNamedType >> classDescription [
	<typPraResult: 'ClassDescription'>
	self assert: [ self hasClassDescription ].
	^ classDescription
]

{ #category : #polymorphic }
TypNamedType >> copyWithParameters: aCollection [
	| copy |
	copy := self copy.
	copy hasSuperType
		ifTrue: [ copy superType: (copy superType copyWithParameters: aCollection) ].
	^ copy
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

{ #category : #accessing }
TypNamedType >> hasSuperType [
	^ superType isNotNil
		or: [ self hasClassDescription
				and: [ self classDescription superclass isNotNil ] ]
]

{ #category : #comparing }
TypNamedType >> hash [
	^ super hash bitXor: name hash
]

{ #category : #initialization }
TypNamedType >> initialize [
	<typPraVariable: 'name' as: 'String'>
	<typPraVariable: 'classDescription' as: '{!,ClassDescription}'>
	<typPraVariable: 'hasClassDescription' as: '{!,Boolean}'>
	super initialize
]

{ #category : #accessing }
TypNamedType >> initializeClassDescription: aClassDescription [
	<typPraArguments: 'ClassDescription'>
	classDescription := aClassDescription.
	name := classDescription name.
	hasClassDescription := true
]

{ #category : #accessing }
TypNamedType >> initializeName: anObject [
	<typPraArguments: 'String'>
	name := anObject.
	hasClassDescription := nil
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
	^ self superType parameters
]

{ #category : #printing }
TypNamedType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << name asString
]

{ #category : #accessing }
TypNamedType >> superType [
	self assert: [ self hasSuperType ].
	^ superType
		ifNil: [ superType := classDescription superclass typAsType ]
]
