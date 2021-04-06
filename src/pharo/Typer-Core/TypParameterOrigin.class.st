Class {
	#name : #TypParameterOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'type',
		'name'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypParameterOrigin class >> type: aType name: aString [
	^ self new
		initializeType: aType name: aString;
		yourself
]

{ #category : #accessing }
TypParameterOrigin >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	anObject type = type
		ifFalse: [ ^ false ].
	^ anObject name = name
]

{ #category : #accessing }
TypParameterOrigin >> hash [
	^ (super hash bitXor: type hash) bitXor: name hash
]

{ #category : #accessing }
TypParameterOrigin >> initializeType: aType name: aString [
	type := aType.
	name := aString
]

{ #category : #accessing }
TypParameterOrigin >> name [
	^ name
]

{ #category : #accessing }
TypParameterOrigin >> printOn: aStream [
	aStream
		nextPutAll: name;
		nextPutAll: ' of '.
	type printOn: aStream
]

{ #category : #accessing }
TypParameterOrigin >> type [
	^ type
]
