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
	super = anObject ifFalse: [ ^ false ].
	anObject selector = selector ifFalse: [ ^ false ].
	^ anObject receiver = receiver
]

{ #category : #testing }
TypPropertyLookup >> hasParent [
	^ receiver hasSuper
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

{ #category : #invalidation }
TypPropertyLookup >> invalidateOnClassChange: aClassAnnouncement [

	^ (super invalidateOnClassChange: aClassAnnouncement) or:
		  (receiver invalidateOnClassChange: aClassAnnouncement)
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
