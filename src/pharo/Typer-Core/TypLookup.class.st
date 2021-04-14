Class {
	#name : #TypLookup,
	#superclass : #Object,
	#instVars : [
		'parent'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookup >> = anObject [
	anObject == self
		ifTrue: [ ^ true ].
	anObject class = self class
		ifFalse: [ ^ false ].
	^ anObject parent = parent
]

{ #category : #accessing }
TypLookup >> asCollection [
	^ {self}
]

{ #category : #accessing }
TypLookup >> asOrigin [
	^ TypLookupOrigin lookup: self
]

{ #category : #copying }
TypLookup >> copyAsSuper [
	self subclassResponsibility
]

{ #category : #testing }
TypLookup >> hasSuper [
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : #accessing }
TypLookup >> hash [
	^ self class hash bitXor: parent hash
]

{ #category : #accessing }
TypLookup >> initializeParent: aLookup [
	parent := aLookup
]

{ #category : #accessing }
TypLookup >> parent [
	^ parent
]

{ #category : #accessing }
TypLookup >> printOn: aStream [
	aStream nextPutAll: ' | '.
	parent printOn: aStream
]

{ #category : #accessing }
TypLookup >> root [
	^ parent ifNil: self ifNotNil: #root
]
