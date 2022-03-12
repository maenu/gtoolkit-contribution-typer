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

	^ super compiler addPlugin: TypEdgePragmaCompilerPlugin
]

{ #category : #invalidation }
TypNode class >> invalidateAll [

	<script>
	^ self allSubInstancesDo: #invalidate
]

{ #category : #testing }
TypNode class >> isAbstract [

	^ self == TypNode
]

{ #category : #accessing }
TypNode >> edges [

	^ incoming values , outgoing values
]

{ #category : #accessing }
TypNode >> incoming [

	^ incoming values flatCollect: #yourself
]

{ #category : #accessing }
TypNode >> incoming: anObject [

	^ (incoming at: anObject) anyOne
]

{ #category : #accessing }
TypNode >> incomingAdd: anEdge [

	self assert: [ anEdge origin outgoingIncludes: anEdge ].
	incoming
		at: anEdge key
		ifPresent: [ :e | 
			e add: anEdge.
			e ]
		ifAbsentPut: [ IdentitySet with: anEdge ]
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

	^ incoming
		  at: anObject
		  ifPresent: [ :e | aBlock value: e anyOne origin ]
		  ifAbsent: anotherBlock
]

{ #category : #accessing }
TypNode >> incomingAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [

	^ incoming
		  at: anObject
		  ifPresent: [ :e | aBlock value: e anyOne origin ]
		  ifAbsent: [ 
		  anotherBlock value outgoingAddTarget: self key: anObject ]
]

{ #category : #converting }
TypNode >> incomingAt: anObject put: aNode [

	incoming at: anObject ifPresent: [ :c | 
		c ifNotEmpty: [ 
			| e |
			e := c anyOne.
			e origin = aNode ifTrue: [ ^ aNode ].
			e origin outgoingRemove: e ] ].
	^ self incomingAddOrigin: aNode key: anObject
]

{ #category : #testing }
TypNode >> incomingIncludes: anEdge [

	^ incoming
		  at: anEdge key
		  ifPresent: [ :e | e includes: anEdge ]
		  ifAbsent: [ false ]
]

{ #category : #accessing }
TypNode >> incomingRemove: anEdge [

	self assert: [ (anEdge origin outgoingIncludes: anEdge) not ].
	incoming
		at: anEdge key
		ifPresent: [ :e | e remove: anEdge ]
		ifAbsent: [ "noop" ]
]

{ #category : #accessing }
TypNode >> incomingRemoveAt: anObject [

	incoming
		at: anObject
		ifPresent: [ :e | e copy do: [ :f | f origin outgoingRemove: f ] ]
]

{ #category : #accessing }
TypNode >> initialize [

	<typPraVariable: 'incoming' as: 'IdentityDictionary<?,IdentitySet<TypEdge>>'>
	<typPraVariable: 'outgoing' as: 'IdentityDictionary<?,IdentitySet<TypEdge>>'>
	super initialize.
	incoming := IdentityDictionary new.
	outgoing := IdentityDictionary new
]

{ #category : #invalidation }
TypNode >> invalidate [

	incoming removeAll.
	outgoing removeAll
]

{ #category : #invalidation }
TypNode >> invalidateOnClassChange: aClassAnnouncement [

	
]

{ #category : #invalidation }
TypNode >> invalidateOnMethodChange: aMethodAnnouncement [

	
]

{ #category : #accessing }
TypNode >> neighbors [

	^ (self outgoing collect: #target as: IdentitySet)
	  , (self incoming collect: #origin as: IdentitySet)
]

{ #category : #accessing }
TypNode >> outgoing [

	^ outgoing values flatCollect: #yourself
]

{ #category : #accessing }
TypNode >> outgoing: anObject [

	^ (outgoing at: anObject) anyOne
]

{ #category : #accessing }
TypNode >> outgoingAdd: anEdge [

	self assert: [ anEdge origin == self ].
	outgoing
		at: anEdge key
		ifPresent: [ :e | 
			e add: anEdge.
			e ]
		ifAbsentPut: [ IdentitySet with: anEdge ].
	anEdge target incomingAdd: anEdge.
	^ anEdge
]

{ #category : #accessing }
TypNode >> outgoingAddTarget: aNode key: anObject [

	self outgoingAdd: (TypEdge origin: self target: aNode key: anObject).
	^ aNode
]

{ #category : #converting }
TypNode >> outgoingAt: anObject [

	^ (self outgoing: anObject) target
]

{ #category : #converting }
TypNode >> outgoingAt: anObject ifAbsent: aBlock [

	^ self outgoingAt: anObject ifPresent: #yourself ifAbsent: aBlock
]

{ #category : #converting }
TypNode >> outgoingAt: anObject ifAbsentPut: aBlock [

	^ self outgoingAt: anObject ifPresent: #yourself ifAbsentPut: aBlock
]

{ #category : #accessing }
TypNode >> outgoingAt: anObject ifPresent: aBlock ifAbsent: anotherBlock [

	^ outgoing
		  at: anObject
		  ifPresent: [ :e | aBlock value: e anyOne target ]
		  ifAbsent: anotherBlock
]

{ #category : #accessing }
TypNode >> outgoingAt: anObject ifPresent: aBlock ifAbsentPut: anotherBlock [

	^ outgoing
		  at: anObject
		  ifPresent: [ :e | aBlock value: e anyOne target ]
		  ifAbsent: [ 
		  self outgoingAddTarget: anotherBlock value key: anObject ]
]

{ #category : #converting }
TypNode >> outgoingAt: anObject put: aNode [

	outgoing at: anObject ifPresent: [ :c | 
		c ifNotEmpty: [ 
			| e |
			e := c anyOne.
			e target = aNode ifTrue: [ ^ aNode ].
			self outgoingRemove: e ] ].
	^ self outgoingAddTarget: aNode key: anObject
]

{ #category : #testing }
TypNode >> outgoingIncludes: anEdge [

	^ outgoing
		  at: anEdge key
		  ifPresent: [ :e | e includes: anEdge ]
		  ifAbsent: [ false ]
]

{ #category : #accessing }
TypNode >> outgoingRemove: anEdge [

	outgoing
		at: anEdge key
		ifPresent: [ :e | e remove: anEdge ]
		ifAbsent: [ "noop" ].
	^ anEdge target
		  incomingRemove: anEdge;
		  yourself
]

{ #category : #accessing }
TypNode >> outgoingRemoveAt: anObject [

	outgoing
		at: anObject
		ifPresent: [ :e | e copy do: [ :f | self outgoingRemove: f ] ]
]

{ #category : #accessing }
TypNode >> postCopy [

	super postCopy.
	incoming := IdentityDictionary new.
	outgoing := IdentityDictionary new
]

{ #category : #accessing }
TypNode >> typIsNode [

	^ true
]
