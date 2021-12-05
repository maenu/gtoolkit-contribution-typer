Class {
	#name : #TypVariableType,
	#superclass : #TypType,
	#instVars : [
		'name'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypVariableType class >> named: aString [
	<typPraArguments: 'String'>
	^ self new
		initializeName: aString;
		yourself
]

{ #category : #'instance creation' }
TypVariableType class >> named: aString superType: aType [

	<typPraArguments: 'String,TypType'>
	^ (self named: aString)
		  initializeSuperType: aType;
		  yourself
]

{ #category : #comparing }
TypVariableType >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #comparing }
TypVariableType >> > aType [
	^ superType >= aType
]

{ #category : #polymorphic }
TypVariableType >> arguments [

	^ superType arguments
]

{ #category : #polymorphic }
TypVariableType >> at: aString [
	^ superType at: aString
]

{ #category : #polymorphic }
TypVariableType >> classDescription [
	^ superType classDescription
]

{ #category : #polymorphic }
TypVariableType >> copyWithAt: aString put: aType [

	^ self copyWithSuperType: (superType copyWithAt: aString put: aType)
]

{ #category : #comparing }
TypVariableType >> hashSkipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ ^ 43 ].
	^ (43 bitXor: name hash) bitXor: (super hashSkipping: anIdentitySet)
]

{ #category : #initialization }
TypVariableType >> initialize [
	<typPraVariable: 'name' as: 'String'>
	<typPraVariable: 'scope' as: '{!,TypType}'>
	<typPraVariable: 'superType' as: 'TypType'>
	super initialize.
	superType := ProtoObject typAsType
]

{ #category : #accessing }
TypVariableType >> initializeName: aString [
	<typPraArguments: 'String'>
	self assert: [ aString size > 1 ].
	self assert: [ aString first = $@ ].
	name := aString
]

{ #category : #invalidation }
TypVariableType >> isAffectedByClassChange: aClassAnnouncement [

	^ superType isAffectedByClassChange: aClassAnnouncement
]

{ #category : #invalidation }
TypVariableType >> isAffectedByMethodChange: aMethodAnnouncement [

	^ superType isAffectedByMethodChange: aMethodAnnouncement
]

{ #category : #testing }
TypVariableType >> isVariable [
	^ true
]

{ #category : #accessing }
TypVariableType >> name [
	^ name
]

{ #category : #printing }
TypVariableType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream nextPutAll: name asString.
	superType = ProtoObject typAsType
		ifFalse: [ aStream nextPutAll: '<='.
			superType printOn: aStream skipping: anIdentitySet , {self} ]
]

{ #category : #polymorphic }
TypVariableType >> result [
	^ superType result
]
