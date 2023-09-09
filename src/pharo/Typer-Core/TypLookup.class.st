Class {
	#name : #TypLookup,
	#superclass : #TypEdgeKey,
	#instVars : [
		'resolver',
		'parent',
		'child',
		'result'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookup >> = anObject [
	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	^ anObject parent = parent
]

{ #category : #accessing }
TypLookup >> allParents [
	self hasParent ifFalse: [ ^ {self} ].
	^ {self} asOrderedCollection , self asParent allParents
]

{ #category : #copying }
TypLookup >> asParent [
	self subclassResponsibility
]

{ #category : #testing }
TypLookup >> hasParent [
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : #accessing }
TypLookup >> hash [
	^ parent hash
]

{ #category : #accessing }
TypLookup >> initializeParent: aLookup [
	self assert: [ parent isNil ].
	parent := aLookup
]

{ #category : #invalidation }
TypLookup >> invalidateOnClassChange: aClassAnnouncement [

	| changed |
	changed := false.
	resolver ifNotNil: [ 
		changed := resolver
			           invalidate: self
			           onClassChange: aClassAnnouncement ].
	self hasParent ifFalse: [ ^ changed ].
	^ changed or:
		  (self asParent invalidateOnClassChange: aClassAnnouncement)
]

{ #category : #invalidation }
TypLookup >> invalidateOnMethodChange: aMethodAnnouncement [

	| changed |
	changed := false.
	resolver ifNotNil: [ 
		changed := resolver
			           invalidate: self
			           onMethodChange: aMethodAnnouncement ].
	self hasParent ifFalse: [ ^ changed ].
	^ changed or:
		  (self asParent invalidateOnMethodChange: aMethodAnnouncement)
]

{ #category : #accessing }
TypLookup >> parent [
	^ parent
]

{ #category : #accessing }
TypLookup >> printOn: aStream [

	parent ifNil: [ ^ self ].
	aStream nextPutAll: ' | '.
	parent printOn: aStream
]

{ #category : #accessing }
TypLookup >> resolved [
	^ resolver
		ifNil: [ self hasParent ifTrue: [ self asParent resolved ] ifFalse: [ self ] ]
		ifNotNil: [ self ]
]

{ #category : #accessing }
TypLookup >> resolver [
	^ resolver
]

{ #category : #accessing }
TypLookup >> resolver: aResolver [
	resolver := aResolver
]

{ #category : #accessing }
TypLookup >> result [
	^ result
]

{ #category : #accessing }
TypLookup >> result: anObject [
	result := anObject
]

{ #category : #accessing }
TypLookup >> root [
	^ parent ifNil: self ifNotNil: #root
]
