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
TypNode >> incoming: anObject [

	^ incoming detect: [ :e | e data = anObject ]
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

	^ (self incoming: anObject) origin
]

{ #category : #converting }
TypNode >> incomingAt: anObject ifAbsentPut: aBlock [

	^ self incomingAt: anObject ifPresent: #yourself ifAbsentPut: aBlock
]

{ #category : #accessing }
TypNode >> incomingAt: anObject ifPresent: aBlock ifAbsent: anotherBlock [

	^ incoming
		  detect: [ :e | e data = anObject ]
		  ifFound: [ :e | aBlock value: e origin ]
		  ifNone: anotherBlock
]

{ #category : #accessing }
TypNode >> incomingAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [

	^ incoming
		  detect: [ :e | e data = anObject ]
		  ifFound: [ :e | aBlock value: e origin ]
		  ifNone: [ 
		  anotherBlock value outgoingAddTarget: self data: anObject ]
]

{ #category : #converting }
TypNode >> incomingAt: anObject put: aNode [

	incoming detect: [ :e | e data = anObject ] ifFound: [ :e | 
		e origin = aNode ifTrue: [ ^ aNode ].
		e origin outgoingRemove: e ].
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

	<typPraVariable: 'incoming' as: 'IdentitySet<TypEdge>'>
	<typPraVariable: 'outgoing' as: 'IdentitySet<TypEdge>'>
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
TypNode >> outgoing: anObject [

	^ outgoing detect: [ :e | e data = anObject ]
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

	^ (self outgoing: anObject) target
]

{ #category : #converting }
TypNode >> outgoingAt: anObject ifAbsentPut: aBlock [

	^ self outgoingAt: anObject ifPresent: #yourself ifAbsentPut: aBlock
]

{ #category : #accessing }
TypNode >> outgoingAt: anObject ifPresent: aBlock ifAbsent: anotherBlock [

	^ outgoing
		  detect: [ :e | e data = anObject ]
		  ifFound: [ :e | aBlock value: e target ]
		  ifNone: anotherBlock
]

{ #category : #accessing }
TypNode >> outgoingAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [

	^ outgoing
		  detect: [ :e | e data = anObject ]
		  ifFound: [ :e | aBlock value: e target ]
		  ifNone: [ 
		  self outgoingAddTarget: anotherBlock value data: anObject ]
]

{ #category : #converting }
TypNode >> outgoingAt: anObject put: aNode [

	outgoing detect: [ :e | e data = anObject ] ifFound: [ :e | 
		e target = aNode ifTrue: [ ^ aNode ].
		self outgoingRemove: e ].
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
