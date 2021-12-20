Class {
	#name : #TypValueType,
	#superclass : #TypType,
	#instVars : [
		'value'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypValueType class >> value: anObject superType: aType [

	^ self new
		  initializeValue: anObject;
		  initializeSuperType: aType;
		  yourself
]

{ #category : #accessing }
TypValueType >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	value = anObject value ifFalse: [ ^ false ].
	^ self superType = anObject superType
]

{ #category : #accessing }
TypValueType >> hash [

	^ super hash bitXor: value hash
]

{ #category : #accessing }
TypValueType >> initialize [

	<typPraVariable: 'value' as: '{!,Object}'>
	<typPraVariable: 'superType' as: 'TypType'>
	super initialize.
	self initializeSuperType: ProtoObject typAsType
]

{ #category : #accessing }
TypValueType >> initializeValue: anObject [

	value := anObject
]

{ #category : #accessing }
TypValueType >> isValue [

	^ true
]

{ #category : #accessing }
TypValueType >> printOn: aStream skipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ 
		aStream << '.'.
		^ self ].
	value printOn: aStream
]

{ #category : #accessing }
TypValueType >> result [

	^ superType result
]

{ #category : #accessing }
TypValueType >> value [

	^ value
]
