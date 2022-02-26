Class {
	#name : #TypVariableType,
	#superclass : #TypSuperType,
	#instVars : [
		'name'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypVariableType class >> named: aSymbol [

	<typPraArguments: 'Symbol'>
	^ self new
		  initializeName: aSymbol;
		  yourself
]

{ #category : #'instance creation' }
TypVariableType class >> named: aString superType: aType [

	<typPraArguments: 'String,TypType'>
	^ self new
		  initializeName: aString;
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
TypVariableType >> hashSkipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ ^ 43 ].
	^ (43 bitXor: name hash) bitXor: (super hashSkipping: anIdentitySet)
]

{ #category : #initialization }
TypVariableType >> initializeName: aSymbol [

	<typPraArguments: 'Symbol'>
	self assert: [ aSymbol isNotEmpty ].
	name := aSymbol.
	hash := nil
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

	(anIdentitySet includes: self) ifTrue: [ 
		aStream << '.'.
		^ self ].
	name printOn: aStream.
	superType hasSuper ifTrue: [ 
		aStream nextPutAll: '<='.
		superType printOn: aStream skipping: anIdentitySet , { self } ]
]
