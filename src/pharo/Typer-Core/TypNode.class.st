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
	^ self allSubInstancesDo: #removeAllOutgoing
]

{ #category : #testing }
TypNode class >> isAbstract [

	^ self == TypNode
]

{ #category : #accessing }
TypNode >> addIncoming: anEdge [

	self assert: [ anEdge origin outgoing includes: anEdge ].
	incoming add: anEdge
]

{ #category : #accessing }
TypNode >> addOutgoing: anEdge [

	self assert: [ anEdge origin == self ].
	outgoing add: anEdge.
	^ anEdge target
		  addIncoming: anEdge;
		  yourself
]

{ #category : #accessing }
TypNode >> addOutgoingTarget: aNode data: anObject [

	^ self addOutgoing:
		  (TypEdge origin: self target: aNode data: anObject)
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

{ #category : #converting }
TypNode >> outgoingAt: anObject ensure: aNode [

	self flag:
		'TODO could improve linear scan to constant by maintaining index'.
	outgoing
		select: [ :e | e data = anObject ]
		thenDo: [ :e | self removeOutgoing: e ].
	^ self addOutgoingTarget: aNode data: anObject
]

{ #category : #converting }
TypNode >> outgoingAt: anObject ifAbsentPut: aBlock [

	self flag:
		'TODO could improve linear scan to constant by maintaining index'.
	^ outgoing
		  detect: [ :e | e data = anObject ]
		  ifFound: #target
		  ifNone: [ self addOutgoingTarget: aBlock value data: anObject ]
]

{ #category : #accessing }
TypNode >> outgoingAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [

	self flag:
		'TODO could improve linear scan to constant by maintaining index'.
	^ outgoing
		  detect: [ :e | e data = anObject ]
		  ifFound: aBlock
		  ifNone: [ 
		  self addOutgoingTarget: anotherBlock value data: anObject ]
]

{ #category : #accessing }
TypNode >> outgoingRemoveAt: anObject [

	self flag:
		'TODO could improve linear scan to constant by maintaining index'.
	outgoing
		select: [ :e | e data = anObject ]
		thenDo: [ :e | self removeOutgoing: e ]
]

{ #category : #accessing }
TypNode >> postCopy [

	super postCopy.
	incoming := IdentitySet new.
	outgoing := IdentitySet new
]

{ #category : #accessing }
TypNode >> removeAllOutgoing [

	outgoing copy do: [ :e | self removeOutgoing: e ]
]

{ #category : #accessing }
TypNode >> removeIncoming: anEdge [

	self assert: [ (anEdge origin outgoing includes: anEdge) not ].
	incoming remove: anEdge
]

{ #category : #accessing }
TypNode >> removeOutgoing: anEdge [

	outgoing remove: anEdge ifAbsent: [ ^ self ].
	anEdge target typIsNode ifFalse: [ ^ self ].
	^ anEdge target
		  removeIncoming: anEdge;
		  yourself
]

{ #category : #accessing }
TypNode >> typIsNode [

	^ true
]
