Class {
	#name : #TypEdge,
	#superclass : #Object,
	#instVars : [
		'origin',
		'target',
		'key'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypEdge class >> origin: aNode target: anotherNode [

	^ self origin: aNode target: anotherNode key: nil
]

{ #category : #'instance creation' }
TypEdge class >> origin: aNode target: anotherNode key: anObject [

	^ self new
		  initializeOrigin: aNode target: anotherNode key: anObject;
		  yourself
]

{ #category : #comparing }
TypEdge >> < anObject [

	^ key < anObject key
]

{ #category : #comparing }
TypEdge >> <= anObject [

	^ key == anObject key or: [ key < anObject key ]
]

{ #category : #accessing }
TypEdge >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	self class == anObject class ifFalse: [ ^ false ].
	^ origin == anObject origin and: [ 
		  target == anObject target and: [ key == anObject key ] ]
]

{ #category : #comparing }
TypEdge >> > anObject [

	^ key > anObject key
]

{ #category : #comparing }
TypEdge >> >= anObject [

	^ key == anObject key or: [ key > anObject key ]
]

{ #category : #accessing }
TypEdge >> hash [

	^ (origin identityHash bitXor: target identityHash) bitXor: key identityHash
]

{ #category : #initialization }
TypEdge >> initializeOrigin: aNode target: anotherNode key: anObject [

	self assert: [ aNode typIsNode ].
	self assert: [ anotherNode typIsNode ].
	origin := aNode.
	target := anotherNode.
	key := anObject
]

{ #category : #accessing }
TypEdge >> key [

	^ key
]

{ #category : #accessing }
TypEdge >> nodes [

	^ { 
		  origin.
		  target }
]

{ #category : #accessing }
TypEdge >> origin [

	^ origin
]

{ #category : #accessing }
TypEdge >> printOn: aStream [

	key printOn: aStream
]

{ #category : #accessing }
TypEdge >> target [

	^ target
]
