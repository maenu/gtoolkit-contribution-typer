Class {
	#name : #TypNode,
	#superclass : #Object,
	#instVars : [
		'incoming',
		'outgoing'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #compiler }
TypNode class >> compiler [

	^ super compiler addPlugin: TypEdgePragmaCompilerAstPlugin
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
TypNode >> incomingAdd: anEdge [

	self assert: [ anEdge origin outgoing includes: anEdge ].
	incoming add: anEdge
]

{ #category : #accessing }
TypNode >> incomingAddOrigin: aNode data: anObject [

	aNode outgoingAddTarget: self data: anObject.
	^ aNode
]

{ #category : #converting }
TypNode >> incomingAt: anObject [

	^ incoming detect: [ :e | e data = anObject ]
]

{ #category : #converting }
TypNode >> incomingAt: anObject ifAbsentPut: aBlock [

	^ self incomingAt: anObject ifPresent: #origin ifAbsentPut: aBlock
]

{ #category : #accessing }
TypNode >> incomingAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [

	^ incoming
		  detect: [ :e | e data = anObject ]
		  ifFound: aBlock
		  ifNone: [ 
		  anotherBlock value outgoingAddTarget: self data: anObject ]
]

{ #category : #converting }
TypNode >> incomingAt: anObject put: aNode [

	self incomingRemoveAt: anObject.
	^ self incomingAddOrigin: aNode data: anObject
]

{ #category : #accessing }
TypNode >> incomingRemove: anEdge [

	self assert: [ (anEdge origin outgoing includes: anEdge) not ].
	incoming remove: anEdge
]

{ #category : #accessing }
TypNode >> incomingRemoveAll [

	incoming copy do: [ :e | e origin outgoingRemove: e ]
]

{ #category : #accessing }
TypNode >> incomingRemoveAt: anObject [

	incoming
		select: [ :e | e data = anObject ]
		thenDo: [ :e | e origin outgoingRemove: e ]
]

{ #category : #accessing }
TypNode >> initialize [

	super initialize.
	incoming := IdentitySet new.
	outgoing := IdentitySet new
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
TypNode >> outgoingAdd: anEdge [

	self assert: [ anEdge origin == self ].
	outgoing add: anEdge.
	anEdge target incomingAdd: anEdge.
	^ anEdge target
]

{ #category : #accessing }
TypNode >> outgoingAddTarget: aNode data: anObject [

	^ self outgoingAdd:
		  (TypEdge origin: self target: aNode data: anObject)
]

{ #category : #converting }
TypNode >> outgoingAt: anObject [

	^ outgoing detect: [ :e | e data = anObject ]
]

{ #category : #converting }
TypNode >> outgoingAt: anObject ifAbsentPut: aBlock [

	^ self outgoingAt: anObject ifPresent: #target ifAbsentPut: aBlock
]

{ #category : #accessing }
TypNode >> outgoingAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [

	self flag:
		'TODO could improve linear scan to constant by maintaining index'.
	^ outgoing
		  detect: [ :e | e data = anObject ]
		  ifFound: aBlock
		  ifNone: [ 
		  self outgoingAddTarget: anotherBlock value data: anObject ]
]

{ #category : #converting }
TypNode >> outgoingAt: anObject put: aNode [

	self outgoingRemoveAt: anObject.
	^ self outgoingAddTarget: aNode data: anObject
]

{ #category : #accessing }
TypNode >> outgoingRemove: anEdge [

	| target |
	outgoing remove: anEdge ifAbsent: [ ^ self ].
	target := anEdge target.
	target typIsNode ifFalse: [ ^ self ].
	target incomingRemove: anEdge.
	^ target
]

{ #category : #accessing }
TypNode >> outgoingRemoveAll [

	outgoing copy do: [ :e | self outgoingRemove: e ]
]

{ #category : #accessing }
TypNode >> outgoingRemoveAt: anObject [

	self flag:
		'TODO could improve linear scan to constant by maintaining index'.
	outgoing
		select: [ :e | e data = anObject ]
		thenDo: [ :e | self outgoingRemove: e ]
]

{ #category : #accessing }
TypNode >> postCopy [

	super postCopy.
	incoming := IdentitySet new.
	outgoing := IdentitySet new
]

{ #category : #accessing }
TypNode >> typIsNode [

	^ true
]
