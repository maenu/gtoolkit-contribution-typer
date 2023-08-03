Class {
	#name : #TypLookup,
	#superclass : #TypEdgeKey,
	#instVars : [
		'superLookup',
		'resolver',
		'childLookup'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookup >> = anObject [
	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
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
TypLookup >> initializeResolver: anObject [
	resolver := anObject
]

{ #category : #accessing }
TypLookup >> initializeSuper: aLookup [
	superLookup := aLookup
]

{ #category : #invalidation }
TypLookup >> invalidateOnClassChange: aClassAnnouncement [

	| changed |
	changed := false.
	resolver ifNotNil: [ 
		changed := resolver
			           invalidate: self
			           onClassChange: aClassAnnouncement ].
	self hasSuper ifFalse: [ ^ changed ].
	^ changed or:
		  (self asSuper invalidateOnClassChange: aClassAnnouncement)
]

{ #category : #invalidation }
TypLookup >> invalidateOnMethodChange: aMethodAnnouncement [

	| changed |
	changed := false.
	resolver ifNotNil: [ 
		changed := resolver
			           invalidate: self
			           onMethodChange: aMethodAnnouncement ].
	self hasSuper ifFalse: [ ^ changed ].
	^ changed or:
		  (self asSuper invalidateOnMethodChange: aMethodAnnouncement)
]

{ #category : #accessing }
TypLookup >> printOn: aStream [

	superLookup ifNil: [ ^ self ].
	aStream nextPutAll: ' | '.
	superLookup printOn: aStream
]

{ #category : #accessing }
TypLookup >> resolver [

	^ resolver
]

{ #category : #accessing }
TypLookup >> root [
	^ superLookup ifNil: self ifNotNil: #root
]

{ #category : #accessing }
TypLookup >> super [
	^ superLookup
]
