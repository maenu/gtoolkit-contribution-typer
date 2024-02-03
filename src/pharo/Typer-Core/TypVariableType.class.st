Class {
	#name : #TypVariableType,
	#superclass : #TypSuperType,
	#instVars : [
		'name',
		'parent',
		'variance'
	],
	#category : #'Typer-Core-Core'
}

{ #category : #'instance creation' }
TypVariableType class >> named: aSymbol [

	^ self named: aSymbol variance: #co
]

{ #category : #'instance creation' }
TypVariableType class >> named: aSymbol variance: anotherSymbol [

	^ self
		  super: ProtoObject typAsType
		  named: aSymbol
		  variance: anotherSymbol
]

{ #category : #'instance creation' }
TypVariableType class >> super: aType named: aSymbol [
	^ self
		super: aType
		named: aSymbol
		variance: #co
]

{ #category : #'instance creation' }
TypVariableType class >> super: aType named: aSymbol variance: anotherSymbol [

	^ self new
		  initializeSuper: aType;
		  initializeName: aSymbol asSymbol variance: anotherSymbol;
		  yourself
]

{ #category : #comparing }
TypVariableType >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	name = anObject name ifFalse: [ ^ false ].
	^ variance = anObject variance
]

{ #category : #comparing }
TypVariableType >> > aType [
	(aType isKindOf: self class) ifTrue: [ ^ false ].
	superType = aType ifTrue: [ ^ false ].
	variance = #covariant ifTrue: [ ^ superType > aType ].
	^ superType < aType
]

{ #category : #compatibility }
TypVariableType >> boundTo: aType [

	parent ifNil: [ 
		parent := aType.
		^ self ].
	parent == aType ifTrue: [ ^ self ].
	^ self copy boundTo: aType
]

{ #category : #comparing }
TypVariableType >> hashSkipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ ^ 43 ].
	^ (43 bitXor: name hash) bitXor: (super hashSkipping: anIdentitySet)
]

{ #category : #initialization }
TypVariableType >> initializeName: aSymbol variance: anotherSymbol [

	<typPraArguments: 'Symbol,Symbol'>
	self assert: [ aSymbol isNotEmpty ].
	self assert: [ #( co contra ) includes: anotherSymbol ].
	name := aSymbol.
	variance := anotherSymbol.
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

{ #category : #copying }
TypVariableType >> postCopy [

	"nils parent to make it unbound"

	super postCopy.
	parent := nil
]

{ #category : #'as yet unclassified' }
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
	(parent isNotNil and: [ (anIdentitySet includes: parent) not ]) ifTrue: [ 
		parent printNameOn: aStream skipping: anIdentitySet.
		aStream nextPut: $: ].
	name printOn: aStream.
	superType hasSuper ifTrue: [ 
		aStream nextPutAll: '<='.
		superType printOn: aStream skipping: anIdentitySet , { self } ]
]

{ #category : #accessing }
TypVariableType >> variance [

	^ variance
]

{ #category : #converting }
TypVariableType >> withSuper: aType [

	^ self class super: aType named: name variance: variance
]
