Class {
	#name : #TypVariableType,
	#superclass : #TypSuperType,
	#instVars : [
		'name',
		'parent'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypVariableType class >> named: aSymbol [

	^ self new
		  initializeName: aSymbol asSymbol;
		  yourself
]

{ #category : #'instance creation' }
TypVariableType class >> named: aSymbol super: aType [

	^ self new
		  initializeName: aSymbol asSymbol;
		  initializeSuper: aType;
		  yourself
]

{ #category : #comparing }
TypVariableType >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #enumerating }
TypVariableType >> bind: aType [

	parent ifNil: [ 
		parent := aType.
		^ self ].
	parent := { 
		          parent.
		          aType } typAsType
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

{ #category : #initialization }
TypVariableType >> initializeParent: aType name: aSymbol [

	self assert: [ aSymbol isNotEmpty ].
	parent := aType.
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
TypVariableType >> printNameOn: aStream skipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ ^ self ].
	name printOn: aStream.
	superType hasSuper ifTrue: [ 
		aStream nextPutAll: '<='.
		superType printOn: aStream skipping: anIdentitySet , { self } ]
]

{ #category : #printing }
TypVariableType >> printOn: aStream skipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ 
		aStream << '.'.
		^ self ].
	(parent isNil or: [ anIdentitySet includes: parent ]) ifFalse: [ 
		parent printNameOn: aStream skipping: anIdentitySet.
		aStream nextPut: $: ].
	name printOn: aStream.
	superType hasSuper ifTrue: [ 
		aStream nextPutAll: '<='.
		superType printOn: aStream skipping: anIdentitySet , { self } ]
]

{ #category : #converting }
TypVariableType >> withSuper: aType [

	^ self class named: name super: aType
]
