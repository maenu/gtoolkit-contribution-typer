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

	^ self flowOutgoing
		  inject: false
		  into: [ :r :e | r or: (e state: state copy) ]
]

{ #category : #'as yet unclassified' }
TypInfNode >> constrainTo: aType in: aState [

	| type |
	type := aState at: self.
	(type isUnknown or: [ type > aType ]) ifTrue: [ 
		aState at: self put: aType ]
]

{ #category : #'as yet unclassified' }
TypInfNode >> flowEdges [

	^ self flowIncoming , self flowOutgoing
]

{ #category : #'as yet unclassified' }
TypInfNode >> flowEdgesAll [

	| edges |
	edges := IdentitySet new.
	self flowNodesAll do: [ :n | edges addAll: n flowEdges ].
	^ edges
]

{ #category : #'as yet unclassified' }
TypInfNode >> flowIncoming [

	^ incoming select: [ :e | 
		  (e isKindOf: TypInfEdge) and: [ e isFlow ] ]
]

{ #category : #'as yet unclassified' }
TypInfNode >> flowNodesAll [

	| nodes queue |
	nodes := IdentitySet new.
	queue := LinkedList with: self.
	[ queue isEmpty ] whileFalse: [ 
		| current origins targets |
		current := queue removeFirst.
		origins := current incoming
			           collect: #origin
			           thenSelect: [ :e | e isKindOf: TypInfNode ].
		targets := current outgoing
			           collect: #target
			           thenSelect: [ :e | e isKindOf: TypInfNode ].
		queue addAll: ((origins , targets) asIdentitySet difference: nodes).
		nodes add: current ].
	^ nodes
]

{ #category : #'as yet unclassified' }
TypInfNode >> flowOutgoing [

	^ outgoing select: [ :e | 
		  (e isKindOf: TypInfEdge) and: [ e isFlow ] ]
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

	self flag: 'FIXME'
	"^ selfType <= aClassAnnouncement classAffected typAsType"
]

{ #category : #accessing }
TypInfNode >> invalidateOnMethodChange: aMethodAnnouncement [

	self flag: 'FIXME'
	"^ selfType <= aMethodAnnouncement methodAffected methodClass typAsType"
]

{ #category : #accessing }
TypInfNode >> next [

	^ self outgoingAt: #next
]

{ #category : #accessing }
TypInfNode >> next: aNode [

	^ self outgoingAt: #next put: aNode
]

{ #category : #accessing }
TypInfNode >> node [
	^ node
]

{ #category : #accessing }
TypInfNode >> outgoingAddTarget: aNode data: anObject [

	^ self outgoingAdd:
		  (TypInfEdge origin: self target: aNode data: anObject)
]

{ #category : #printing }
TypInfNode >> printOn: aStream [

	aStream nextPutAll: (node printStringLimitedTo: 32)
]

{ #category : #'as yet unclassified' }
TypInfNode >> return [

	^ self outgoingAt: #return
]

{ #category : #'as yet unclassified' }
TypInfNode >> return: aNode [

	^ self outgoingAt: #return put: aNode
]

{ #category : #'as yet unclassified' }
TypInfNode >> returnBlock [

	^ self outgoingAt: #returnBlock
]

{ #category : #'as yet unclassified' }
TypInfNode >> returnBlock: aNode [

	^ self outgoingAt: #returnBlock put: aNode
]

{ #category : #'as yet unclassified' }
TypInfNode >> slurp [

	| ins |
	ins := self flowIncoming collect: #state as: LinkedList.
	state := ins removeLast copy.
	[ ins isEmpty ] whileFalse: [ state := state join: ins removeLast ]
]

{ #category : #'as yet unclassified' }
TypInfNode >> slurpAndBurp [

	self flowIncoming ifEmpty: [ ^ false ].
	self slurp.
	self transfer.
	^ self burp
]

{ #category : #accessing }
TypInfNode >> transfer [

	"transfer the given state from in to out"

	
]

{ #category : #accessing }
TypInfNode >> type [

	^ self outgoingAt: #type ifAbsentPut: [ state at: self ]
]

{ #category : #accessing }
TypInfNode >> type: aNode [

	^ self outgoingAt: #type put: aNode
]
