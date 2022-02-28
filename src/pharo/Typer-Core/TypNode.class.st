Class {
	#name : #TypNode,
	#superclass : #Object,
	#instVars : [
		'incoming',
		'outgoing',
		'incomingIndex',
		'outgoingIndex'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #compiler }
TypNode class >> compiler [

	^ super compiler addPlugin: TypEdgePragmaCompilerPlugin
]

{ #category : #invalidation }
TypNode class >> invalidateAll [

	<script>
	^ self allSubInstancesDo: #outgoingRemoveAll
]

{ #category : #testing }
TypNode class >> isAbstract [

	^ self == TypNode
]

{ #category : #accessing }
TypNode >> edges [

	^ incoming , outgoing
]

{ #category : #accessing }
TypNode >> incoming [

	^ incoming
]

{ #category : #accessing }
TypNode >> incoming: anObject [

	^ incomingIndex at: anObject
]

{ #category : #accessing }
TypNode >> incomingAdd: anEdge [

	self assert: [ anEdge origin outgoing includes: anEdge ].
	incoming add: anEdge
]

{ #category : #accessing }
TypNode >> incomingAddOrigin: aNode key: anObject [

	aNode outgoingAddTarget: self key: anObject.
	^ aNode
]

{ #category : #converting }
TypNode >> incomingAt: anObject [

	^ (self incoming: anObject) origin
]

{ #category : #converting }
TypNode >> incomingAt: anObject ifAbsentPut: aBlock [

	^ self incomingAt: anObject ifPresent: #yourself ifAbsentPut: aBlock
]

{ #category : #accessing }
TypNode >> incomingAt: anObject ifPresent: aBlock ifAbsent: anotherBlock [

	^ incomingIndex
		  at: anObject
		  ifPresent: [ :e | aBlock value: e origin ]
		  ifAbsent: anotherBlock
]

{ #category : #accessing }
TypNode >> incomingAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [

	^ incomingIndex
		  at: anObject
		  ifPresent: [ :e | aBlock value: e origin ]
		  ifAbsent: [ 
		  anotherBlock value outgoingAddTarget: self key: anObject ]
]

{ #category : #converting }
TypNode >> incomingAt: anObject put: aNode [

	incomingIndex at: anObject ifPresent: [ :e | 
		e origin = aNode ifTrue: [ ^ aNode ].
		e origin outgoingRemove: e ].
	^ self incomingAddOrigin: aNode key: anObject
]

{ #category : #accessing }
TypNode >> incomingRemove: anEdge [

	self assert: [ (anEdge origin outgoing includes: anEdge) not ].
	incoming remove: anEdge.
	incomingIndex remove: anEdge key
]

{ #category : #accessing }
TypNode >> incomingRemoveAll [

	incoming copy do: [ :e | e origin outgoingRemove: e ]
]

{ #category : #accessing }
TypNode >> incomingRemoveAt: anObject [

	| edge |
	edge := incomingIndex at: anObject.
	edge origin outgoingRemove: edge
]

{ #category : #accessing }
TypNode >> initialize [

	<typPraVariable: 'incoming' as: 'IdentitySet<TypEdge>'>
	<typPraVariable: 'outgoing' as: 'IdentitySet<TypEdge>'>
	<typPraVariable: 'incomingIndex' as: 'IdentityDictionary<?,TypEdge>'>
	<typPraVariable: 'outgoingIndex' as: 'IdentityDictionary<?,TypEdge>'>
	super initialize.
	incoming := IdentitySet new.
	outgoing := IdentitySet new.
	incomingIndex := IdentityDictionary new.
	outgoingIndex := IdentityDictionary new
]

{ #category : #invalidation }
TypNode >> invalidate [

	
]

{ #category : #invalidation }
TypNode >> invalidateOnClassChange: aClassAnnouncement [

	
]

{ #category : #invalidation }
TypNode >> invalidateOnMethodChange: aMethodAnnouncement [

	
]

{ #category : #accessing }
TypNode >> neighbors [

	^ (outgoing collect: #target) , (incoming collect: #origin)
]

{ #category : #accessing }
TypNode >> outgoing [

	^ outgoing
]

{ #category : #accessing }
TypNode >> outgoing: anObject [

	^ outgoingIndex at: anObject
]

{ #category : #accessing }
TypNode >> outgoingAdd: anEdge [

	self assert: [ anEdge origin == self ].
	outgoing add: anEdge.
	anEdge target incomingAdd: anEdge.
	^ anEdge target
]

{ #category : #accessing }
TypNode >> outgoingAddTarget: aNode key: anObject [

	^ self outgoingAdd:
		  (TypEdge origin: self target: aNode key: anObject)
]

{ #category : #converting }
TypNode >> outgoingAt: anObject [

	^ (self outgoing: anObject) target
]

{ #category : #converting }
TypNode >> outgoingAt: anObject ifAbsentPut: aBlock [

	^ self outgoingAt: anObject ifPresent: #yourself ifAbsentPut: aBlock
]

{ #category : #accessing }
TypNode >> outgoingAt: anObject ifPresent: aBlock ifAbsent: anotherBlock [

	^ outgoingIndex
		  at: anObject
		  ifPresent: [ :e | aBlock value: e target ]
		  ifAbsent: anotherBlock
]

{ #category : #accessing }
TypNode >> outgoingAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [

	^ outgoingIndex
		  at: anObject
		  ifPresent: [ :e | aBlock value: e target ]
		  ifAbsent: [ 
		  self outgoingAddTarget: anotherBlock value key: anObject ]
]

{ #category : #converting }
TypNode >> outgoingAt: anObject put: aNode [

	outgoingIndex at: anObject ifPresent: [ :e | 
		e target = aNode ifTrue: [ ^ aNode ].
		self outgoingRemove: e ].
	^ self outgoingAddTarget: aNode key: anObject
]

{ #category : #accessing }
TypNode >> outgoingRemove: anEdge [

	| target |
	outgoing remove: anEdge.
	outgoingIndex removeKey: anEdge key.
	target := anEdge target.
	target incomingRemove: anEdge.
	^ target
]

{ #category : #accessing }
TypNode >> outgoingRemoveAll [

	outgoing copy do: [ :e | self outgoingRemove: e ]
]

{ #category : #accessing }
TypNode >> outgoingRemoveAt: anObject [

	outgoingIndex at: anObject ifPresent: [ :e | self outgoingRemove: e ]
]

{ #category : #accessing }
TypNode >> postCopy [

	super postCopy.
	incoming := IdentitySet new.
	outgoing := IdentitySet new.
	incomingIndex := IdentityDictionary new.
	outgoingIndex := IdentityDictionary new
]

{ #category : #accessing }
TypNode >> typIsNode [

	^ true
]
