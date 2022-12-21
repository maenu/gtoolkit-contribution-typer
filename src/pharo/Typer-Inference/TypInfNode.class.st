Class {
	#name : #TypInfNode,
	#superclass : #TypNode,
	#instVars : [
		'node',
		'state'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfNode class >> node: aNode [

	^ self new
		  initializeNode: aNode;
		  yourself
]

{ #category : #accessing }
TypInfNode >> burp [

	outgoing at: #tighten ifPresent: [ :s | 
		s
			select: #isReturn
			thenDo: [ :e | e set: (state at: self) in: state ] ].
	outgoing
		at: #next
		ifPresent: [ :s | s do: [ :e | e state: state copy ] ]
]

{ #category : #accessing }
TypInfNode >> context [

	^ self incomingAt: node
]

{ #category : #accessing }
TypInfNode >> incomingNext [

	^ self incomingAt: #next
]

{ #category : #accessing }
TypInfNode >> initialize: aState [

	"compute initial state for node"

	state := aState.
	^ state at: self put: TypUnknownType instance
]

{ #category : #initialization }
TypInfNode >> initializeNode: aNode [

	node := aNode
]

{ #category : #accessing }
TypInfNode >> invalidateOnClassChange: aClassAnnouncement [

	^ self type invalidateOnClassChange: aClassAnnouncement
]

{ #category : #accessing }
TypInfNode >> invalidateOnMethodChange: aMethodAnnouncement [

	^ self type invalidateOnMethodChange: aMethodAnnouncement
]

{ #category : #accessing }
TypInfNode >> node [
	^ node
]

{ #category : #accessing }
TypInfNode >> outgoingNext [

	^ self outgoingAt: #next
]

{ #category : #printing }
TypInfNode >> printOn: aStream [

	aStream nextPutAll: (node printStringLimitedTo: 32)
]

{ #category : #accessing }
TypInfNode >> slurp [

	incoming at: #next ifPresent: [ :s | 
		s ifNotEmpty: [ 
			state := (s collect: #state) reduce: [ :a :b | a covariant: b ].
			state := state copy "for good measure" ] ].
	incoming at: #tighten ifPresent: [ :s | 
		s ifNotEmpty: [ 
			| type |
			type := (s collect: [ :e | e getIn: state ]) reduce: [ :a :b | 
				        b covariant: a ].
			state at: self put: type ] ]
]

{ #category : #accessing }
TypInfNode >> slurpAndBurp [

	self
		slurp;
		transfer;
		burp
]

{ #category : #accessing }
TypInfNode >> state [

	^ state
]

{ #category : #'as yet unclassified' }
TypInfNode >> tighten: aType in: aState [

	
]

{ #category : #accessing }
TypInfNode >> transfer [

	"transfer the given state from in to out"

	
]

{ #category : #accessing }
TypInfNode >> type [

	^ state at: self
]
