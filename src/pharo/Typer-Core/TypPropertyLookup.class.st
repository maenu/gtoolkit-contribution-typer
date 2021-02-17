Class {
	#name : #TypPropertyLookup,
	#superclass : #TypLookup,
	#instVars : [
		'selector',
		'receiverType'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypPropertyLookup class >> receiverType: aType selector: aSymbol [
	^ self new
		initializeReceiverType: aType selector: aSymbol;
		yourself
]

{ #category : #comparing }
TypPropertyLookup >> = anObject [
	^ self == anObject
		or: [ self class == anObject class
				and: [ | object |
					object := anObject "typCastAs TypObjectLookup".
					selector = object selector
						and: [ receiverType = object receiverType ] ] ]
]

{ #category : #accessing }
TypPropertyLookup >> copyWithSuperType [
	^ super copyWithSuperType
		initializeReceiverType: receiverType superType selector: selector;
		yourself
]

{ #category : #testing }
TypPropertyLookup >> hasSuperType [
	^ receiverType hasSuperType
]

{ #category : #comparing }
TypPropertyLookup >> hash [
	^ selector hash bitXor: receiverType hash
]

{ #category : #initialization }
TypPropertyLookup >> initialize [
	<typTypeVariable: 'selector' as: 'Symbol'>
	<typTypeVariable: 'receiverType' as: 'TypType'>
	super initialize
]

{ #category : #accessing }
TypPropertyLookup >> initializeReceiverType: aType selector: aSymbol [
	receiverType := aType.
	selector := aSymbol
]

{ #category : #accessing }
TypPropertyLookup >> printOn: aStream [
	receiverType printOn: aStream.
	aStream nextPutAll: '>>'.
	selector printOn: aStream
]

{ #category : #accessing }
TypPropertyLookup >> receiverType [
	<typTypeResultAs: 'TypType'>
	^ receiverType
]

{ #category : #accessing }
TypPropertyLookup >> selector [
	<typTypeResultAs:  'Symbol'>
	^ selector
]
