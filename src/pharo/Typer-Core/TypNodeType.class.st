Class {
	#name : #TypNodeType,
	#superclass : #TypType,
	#instVars : [
		'node'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypNodeType class >> node: aNode [
	^ self new
		node: aNode;
		yourself
]

{ #category : #comparing }
TypNodeType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class and: [ node = (anObject "typCastAs TypNodeType") node ] ]
]

{ #category : #comparing }
TypNodeType >> > aType [
	^ false
]

{ #category : #testing }
TypNodeType >> canUnderstand: aSymbol [
	^ false
]

{ #category : #comparing }
TypNodeType >> hash [
	^ node hash
]

{ #category : #accessing }
TypNodeType >> lookupSelector: aSymbol [
	^ IdentitySet new
]

{ #category : #accessing }
TypNodeType >> node [
	^ node
]

{ #category : #accessing }
TypNodeType >> node: anObject [
	node := anObject
]

{ #category : #printing }
TypNodeType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << 'node'
]
