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
TypPropertyLookup >> asCollection [
	receiver isUnion
		ifFalse: [ ^ super asCollection ].
	^ receiver types
		collect: [ :e | 
			self copy
				initializeParent: self;
				initializeReceiver: e selector: selector;
				yourself ]
]

{ #category : #accessing }
TypPropertyLookup >> copyAsSuper [
	self assert: [ self hasSuper ].
	^ self copy
		initializeParent: self;
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
	<typPraVariable: 'selector' as: 'Symbol'>
	<typPraVariable: 'receiverType' as: 'TypType'>
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
	selector printOn: aStream.
	super printOn: aStream
]

{ #category : #accessing }
TypPropertyLookup >> receiver [
	<typPraResult: 'TypType'>
	^ receiver
]

{ #category : #accessing }
TypPropertyLookup >> selector [
	<typPraResult: 'Symbol'>
	^ selector
]
