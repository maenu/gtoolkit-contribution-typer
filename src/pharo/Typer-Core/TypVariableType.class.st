Class {
	#name : #TypVariableType,
	#superclass : #TypType,
	#instVars : [
		'name',
		'scope'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypVariableType class >> named: aString [
	<typTypeArgument: 1 as: 'String'>
	^ self new
		initializeName: aString;
		yourself
]

{ #category : #'instance creation' }
TypVariableType class >> named: aString superType: aType [
	<typTypeArgument: 1 as: 'String'>
	<typTypeArgument: 2 as: 'TypType'>
	^ (self named: aString)
		superType: aType;
		yourself
]

{ #category : #comparing }
TypVariableType >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	name = anObject name
		ifFalse: [ ^ false ].
	^ superType = anObject superType
]

{ #category : #comparing }
TypVariableType >> > aType [
	^ superType >= aType
]

{ #category : #comparing }
TypVariableType >> hash [
	^ name hash bitXor: superType hash
]

{ #category : #initialization }
TypVariableType >> initialize [
	<typTypeVariable: 'name' as: 'String'>
	<typTypeVariable: 'scope' as: '{!,TypType}'>
	<typTypeVariable: 'superType' as: 'TypType'>
	super initialize.
	superType := ProtoObject typAsType
]

{ #category : #accessing }
TypVariableType >> initializeName: aString [
	<typTypeArgument: 1 as: 'String'>
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

{ #category : #accessing }
TypVariableType >> scope [
	^ scope
]

{ #category : #accessing }
TypVariableType >> scope: anObject [
	self assert: [ scope isNil ].
	scope := anObject
]
