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
				and: [ selector = anObject selector
						and: [ receiverType = anObject receiverType ] ] ]
]

{ #category : #accessing }
TypPropertyLookup >> copyAsSuper [
	self assert: [ self hasSuper ].
	^ self copy
		initializeReceiverType: receiverType superType selector: selector;
		yourself
]

{ #category : #testing }
TypPropertyLookup >> hasSuper [
	^ receiverType hasSuper
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
