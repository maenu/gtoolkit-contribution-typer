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
	self == anObject ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	anObject selector = selector ifFalse: [ ^ false ].
	^ anObject receiver = receiver
]

{ #category : #converting }
TypPropertyLookup >> asParent [
	self assert: [ self hasParent ].
	^ self withReceiver: receiver super
]

{ #category : #invalidation }
TypPropertyLookup >> dependsOnClassDescription: aClassDescription [
	(super dependsOnClassDescription: aClassDescription) ifTrue: [ ^ true ].
	^ receiver dependsOnClassDescription: aClassDescription
]

{ #category : #testing }
TypPropertyLookup >> hasParent [
	^ receiver hasSuper
]

{ #category : #comparing }
TypPropertyLookup >> hash [
	^ selector hash bitXor: receiver hash
]

{ #category : #initialization }
TypPropertyLookup >> initialize [
	<typPraVariable: 'selector' as: 'Symbol'>
	<typPraVariable: 'receiverType' as: 'TypType'>
	super initialize
]

{ #category : #accessing }
TypPropertyLookup >> initializeReceiver: aType selector: aSymbol [
	self assert: [ aType isKindOf: TypType ].
	self assert: [ aType isUnion not ].
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

{ #category : #accessing }
TypPropertyLookup >> withReceiver: aType [
	self subclassResponsibility
]
