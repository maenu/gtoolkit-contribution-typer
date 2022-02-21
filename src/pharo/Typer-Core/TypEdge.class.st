Class {
	#name : #TypEdge,
	#superclass : #Object,
	#instVars : [
		'data',
		'origin',
		'target'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypEdge class >> origin: aNode target: anotherNode [

	^ self origin: aNode target: anotherNode data: nil
]

{ #category : #'instance creation' }
TypEdge class >> origin: aNode target: anotherNode data: anObject [

	^ self new
		  initializeOrigin: aNode target: anotherNode data: anObject;
		  yourself
]

{ #category : #accessing }
TypEdge >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	self class == anObject class ifFalse: [ ^ false ].
	^ origin == anObject origin and: [ 
		  target == anObject target and: [ data = anObject data ] ]
]

{ #category : #accessing }
TypEdge >> data [

	^ data
]

{ #category : #accessing }
TypEdge >> hash [

	^ ((self class hash bitXor: origin identityHash) bitXor:
		   target identityHash) bitXor: data hash
]

{ #category : #initialization }
TypEdge >> initializeOrigin: aNode target: anotherNode data: anObject [

	self assert: [ aNode typIsNode ].
	self assert: [ anotherNode typIsNode ].
	origin := aNode.
	target := anotherNode.
	data := anObject
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

	data printOn: aStream
]

{ #category : #accessing }
TypEdge >> target [

	^ target
]
