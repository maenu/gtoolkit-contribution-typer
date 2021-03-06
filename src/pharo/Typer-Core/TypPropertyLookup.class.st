Class {
	#name : #TypPropertyLookup,
	#superclass : #TypLookup,
	#instVars : [
		'selector',
		'receiver'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #comparing }
TypPropertyLookup >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	anObject selector = selector
		ifFalse: [ ^ false ].
	^ anObject receiver = receiver
]

{ #category : #accessing }
TypPropertyLookup >> copyAsSuper [
	self assert: [ self hasSuper ].
	^ self copy
		initializeReceiver: receiver superType selector: selector;
		yourself
]

{ #category : #testing }
TypPropertyLookup >> hasSuper [
	^ receiver hasSuperType
]

{ #category : #comparing }
TypPropertyLookup >> hash [
	^ (super hash bitXor: selector hash) bitXor: receiver hash
]

{ #category : #initialization }
TypPropertyLookup >> initialize [
	<typTypeVariable: 'selector' as: 'Symbol'>
	<typTypeVariable: 'receiverType' as: 'TypType'>
	super initialize
]

{ #category : #accessing }
TypPropertyLookup >> initializeReceiver: aType selector: aSymbol [
	receiver := aType.
	selector := aSymbol
]

{ #category : #accessing }
TypPropertyLookup >> printOn: aStream [
	receiver printOn: aStream.
	aStream nextPutAll: '>>'.
	selector printOn: aStream
]

{ #category : #accessing }
TypPropertyLookup >> receiver [
	<typTypeResultAs: 'TypType'>
	^ receiver
]

{ #category : #accessing }
TypPropertyLookup >> selector [
	<typTypeResultAs:  'Symbol'>
	^ selector
]
