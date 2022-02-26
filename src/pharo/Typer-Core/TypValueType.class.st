Class {
	#name : #TypValueType,
	#superclass : #TypSuperType,
	#instVars : [
		'value'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypValueType class >> value: anObject superType: aType [

	^ index at: thisContext arguments ifAbsentPut: [ 
		  self new
			  initializeValue: anObject;
			  initializeSuperType: aType;
			  yourself ]
]

{ #category : #comparing }
TypValueType >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	value = anObject value ifFalse: [ ^ false ].
	^ self super = anObject super
]

{ #category : #comparing }
TypValueType >> hashSkipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ ^ 53 ].
	^ (53 bitXor: value hash) bitXor: (super hashSkipping: anIdentitySet)
]

{ #category : #initialization }
TypValueType >> initializeValue: anObject [

	value := anObject.
	hash := nil
]

{ #category : #testing }
TypValueType >> isValue [

	^ true
]

{ #category : #printing }
TypValueType >> printOn: aStream skipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ 
		aStream << '.'.
		^ self ].
	value printOn: aStream
]

{ #category : #accessing }
TypValueType >> value [

	^ value
]
