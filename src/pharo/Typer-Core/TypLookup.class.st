Class {
	#name : #TypLookup,
	#superclass : #TypNode,
	#instVars : [
		'superLookup'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookup >> = anObject [
	anObject == self
		ifTrue: [ ^ true ].
	anObject class = self class
		ifFalse: [ ^ false ].
	^ anObject super = superLookup
]

{ #category : #copying }
TypLookup >> asSuper [
	self subclassResponsibility
]

{ #category : #testing }
TypLookup >> hasSuper [
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : #accessing }
TypLookup >> hash [
	^ superLookup hash
]

{ #category : #accessing }
TypLookup >> initializeSuper: aLookup [
	superLookup := aLookup
]

{ #category : #invalidation }
TypLookup >> invalidateOnClassChange: aClassAnnouncement [

	^ false
]

{ #category : #invalidation }
TypLookup >> invalidateOnMethodChange: aMethodAnnouncement [

	^ false
]

{ #category : #accessing }
TypLookup >> printOn: aStream [

	superLookup ifNil: [ ^ self ].
	aStream nextPutAll: ' | '.
	superLookup printOn: aStream
]

{ #category : #accessing }
TypLookup >> root [
	^ superLookup ifNil: self ifNotNil: #root
]

{ #category : #accessing }
TypLookup >> super [
	^ superLookup
]
