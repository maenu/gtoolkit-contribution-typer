Class {
	#name : 'TypLookup',
	#superclass : 'TypNode',
	#instVars : [
		'parent'
	],
	#category : 'Typer-Core-Lookup'
}

{ #category : 'accessing' }
TypLookup >> = anObject [
	anObject == self
		ifTrue: [ ^ true ].
	anObject class = self class
		ifFalse: [ ^ false ].
	^ anObject parent = parent
]

{ #category : 'copying' }
TypLookup >> copyAsSuper [
	self subclassResponsibility
]

{ #category : 'testing' }
TypLookup >> hasSuper [
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : 'accessing' }
TypLookup >> hash [
	^ parent hash
]

{ #category : 'accessing' }
TypLookup >> initializeParent: aLookup [
	parent := aLookup
]

{ #category : 'invalidation' }
TypLookup >> isInvalidatedByClassAnnouncement: aClassAnnouncement [

	^ false
]

{ #category : 'invalidation' }
TypLookup >> isInvalidatedByMethodAnnouncement: aMethodAnnouncement [

	^ false
]

{ #category : 'accessing' }
TypLookup >> parent [
	^ parent
]

{ #category : 'accessing' }
TypLookup >> printOn: aStream [
	aStream nextPutAll: ' | '.
	parent printOn: aStream
]

{ #category : 'accessing' }
TypLookup >> root [
	^ parent ifNil: self ifNotNil: #root
]
