Class {
	#name : #TypInfEdge,
	#superclass : #Object,
	#instVars : [
		'target',
		'key',
		'origin'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'instance creation' }
TypInfEdge class >> origin: aNode target: anotherNode [
	^ self
		origin: aNode
		target: anotherNode
		key: nil
]

{ #category : #'instance creation' }
TypInfEdge class >> origin: aNode target: anotherNode key: anObject [
	^ self new
		initializeOrigin: aNode
			target: anotherNode
			key: anObject;
		yourself
]

{ #category : #comparing }
TypInfEdge >> < anObject [

	^ key < anObject key
]

{ #category : #comparing }
TypInfEdge >> <= anObject [

	^ key == anObject key or: [ key < anObject key ]
]

{ #category : #accessing }
TypInfEdge >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	self class == anObject class ifFalse: [ ^ false ].
	^ origin == anObject origin and: [ 
		  target == anObject target and: [ key == anObject key ] ]
]

{ #category : #comparing }
TypInfEdge >> > anObject [

	^ key > anObject key
]

{ #category : #comparing }
TypInfEdge >> >= anObject [

	^ key == anObject key or: [ key > anObject key ]
]

{ #category : #accessing }
TypInfEdge >> disable [
	self isDisabled ifTrue: [ ^ self ].
	^ origin
		outRemove: self;
		outAdd: (self copy
				initializeOrigin: origin
					target: target
					key: (key , #Disabled) asSymbol;
				yourself)
]

{ #category : #accessing }
TypInfEdge >> disableOrigin: aNode [
	self assert: [ self isDisabled ].
	^ aNode outAdd: self copy
]

{ #category : #accessing }
TypInfEdge >> enableOrigin: aNode [
	self assert: [ self isDisabled ].
	^ aNode
		outAdd: (self copy
				initializeOrigin: aNode
					target: target
					key: (key copyFrom: 1 to: key size - #Disabled size) asSymbol;
				yourself)
]

{ #category : #accessing }
TypInfEdge >> hash [

	^ (origin identityHash bitXor: target identityHash) bitXor: key identityHash
]

{ #category : #initialization }
TypInfEdge >> initializeOrigin: aNode target: anotherNode key: anObject [
	self assert: [ aNode isKindOf: TypInfNode ].
	self assert: [ anotherNode isKindOf: TypInfNode ].
	origin := aNode.
	target := anotherNode.
	key := anObject
]

{ #category : #accessing }
TypInfEdge >> isDisabled [
	^ key endsWith: #Disabled
]

{ #category : #accessing }
TypInfEdge >> key [

	^ key
]

{ #category : #accessing }
TypInfEdge >> nodes [

	^ { 
		  origin.
		  target }
]

{ #category : #accessing }
TypInfEdge >> origin [

	^ origin
]

{ #category : #accessing }
TypInfEdge >> printOn: aStream [

	key printOn: aStream
]

{ #category : #accessing }
TypInfEdge >> remove [
	origin outRemove: self
]

{ #category : #accessing }
TypInfEdge >> target [

	^ target
]
