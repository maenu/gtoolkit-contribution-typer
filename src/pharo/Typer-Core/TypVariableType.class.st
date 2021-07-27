Class {
	#name : #TypVariableType,
	#superclass : #TypType,
	#instVars : [
		'name',
		'type'
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
		superType: aType;
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
TypVariableType >> at: aString [
	^ superType at: aString
]

{ #category : #polymorphic }
TypVariableType >> at: aString put: aType [
	^ superType at: aString put: aType
]

{ #category : #polymorphic }
TypVariableType >> classDescription [
	^ superType classDescription
]

{ #category : #comparing }
TypVariableType >> hashSkipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ ^ self identityHash ].
	^ ((super hashSkipping: anIdentitySet) bitXor: name hash) bitXor:
		  (superType hashSkipping: anIdentitySet , { self })
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

{ #category : #accessing }
TypVariableType >> type [
	^ type
]

{ #category : #accessing }
TypVariableType >> type: anObject [
	self assert: [ type isNil ].
	type := anObject
]
