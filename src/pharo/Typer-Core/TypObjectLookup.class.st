Class {
	#name : #TypObjectLookup,
	#superclass : #TypLookup,
	#instVars : [
		'selector',
		'receiverType'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypObjectLookup class >> origin: anOrigin receiverType: aType selector: aSymbol [
	^ self new
		initializeOrigin: anOrigin;
		initializeReceiverType: aType selector: aSymbol;
		yourself
]

{ #category : #comparing }
TypObjectLookup >> = anObject [
	^ self == anObject
		or: [ self class == anObject class
				and: [ | object |
					object := anObject "typCastAs TypObjectLookup".
					selector = object selector
						and: [ receiverType = object receiverType ] ] ]
]

{ #category : #testing }
TypObjectLookup >> hasSuperType [
	^ receiverType hasSuperType
]

{ #category : #comparing }
TypObjectLookup >> hash [
	^ selector hash bitXor: receiverType hash
]

{ #category : #initialization }
TypObjectLookup >> initialize [
	<typTypeVariable: 'selector' as: 'Symbol'>
	<typTypeVariable: 'receiverType' as: 'TypType'>
	super initialize
]

{ #category : #accessing }
TypObjectLookup >> initializeReceiverType: aType selector: aSymbol [
	receiverType := aType.
	selector := aSymbol
]

{ #category : #accessing }
TypObjectLookup >> printOn: aStream [
	receiverType printOn: aStream.
	aStream nextPutAll: '>>'.
	selector printOn: aStream
]

{ #category : #accessing }
TypObjectLookup >> receiverType [
	<typTypeResultAs: 'TypType'>
	^ receiverType
]

{ #category : #accessing }
TypObjectLookup >> selector [
	<typTypeResultAs:  'Symbol'>
	^ selector
]
