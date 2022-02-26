Class {
	#name : #TypInfFlowNode,
	#superclass : #TypNode,
	#instVars : [
		'node',
		'state'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowNode class >> node: aNode [

	^ self new
		  initializeNode: aNode;
		  yourself
]

{ #category : #accessing }
TypInfFlowNode >> burp [

	^ self flowOutgoing
		  inject: false
		  into: [ :r :e | r or: (e state: state copy) ]
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> constrainTo: aType in: aState [

	| type |
	type := aState at: self.
	(type isUnknown or: [ type > aType ]) ifTrue: [ 
		aState at: self put: aType ]
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> flowEdges [

	^ self flowIncoming , self flowOutgoing
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> flowEdgesAll [

	| edges |
	edges := IdentitySet new.
	self flowNodesAll do: [ :n | edges addAll: n flowEdges ].
	^ edges
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> flowIncoming [

	^ incoming select: [ :e | 
		  (e isKindOf: TypInfFlowEdge) and: [ e isFlow ] ]
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> flowNodesAll [

	| nodes queue |
	nodes := IdentitySet new.
	queue := LinkedList with: self.
	[ queue isEmpty ] whileFalse: [ 
		| current origins targets |
		current := queue removeFirst.
		origins := current incoming
			           collect: #origin
			           thenSelect: [ :e | e isKindOf: TypInfFlowNode ].
		targets := current outgoing
			           collect: #target
			           thenSelect: [ :e | e isKindOf: TypInfFlowNode ].
		queue addAll: ((origins , targets) asIdentitySet difference: nodes).
		nodes add: current ].
	^ nodes
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> flowOutgoing [

	^ outgoing select: [ :e | 
		  (e isKindOf: TypInfFlowEdge) and: [ e isFlow ] ]
]

{ #category : #accessing }
TypInfFlowNode >> initialize: aState [

	"compute initial state for node"

	aState at: self put: TypUnknownType instance
]

{ #category : #initialization }
TypInfFlowNode >> initializeNode: aNode [

	node := aNode
]

{ #category : #accessing }
TypInfFlowNode >> invalidateOnClassChange: aClassAnnouncement [

	self flag: 'FIXME'
	"^ selfType <= aClassAnnouncement classAffected typAsType"
]

{ #category : #accessing }
TypInfFlowNode >> invalidateOnMethodChange: aMethodAnnouncement [

	self flag: 'FIXME'
	"^ selfType <= aMethodAnnouncement methodAffected methodClass typAsType"
]

{ #category : #accessing }
TypInfFlowNode >> next [

	^ self outgoingAt: #next
]

{ #category : #accessing }
TypInfFlowNode >> next: aNode [

	^ self outgoingAt: #next put: aNode
]

{ #category : #accessing }
TypInfFlowNode >> node [
	^ node
]

{ #category : #accessing }
TypInfFlowNode >> outgoingAddTarget: aNode data: anObject [

	^ self outgoingAdd:
		  (TypInfFlowEdge origin: self target: aNode data: anObject)
]

{ #category : #printing }
TypInfFlowNode >> printOn: aStream [

	aStream nextPutAll: (node printStringLimitedTo: 32)
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> return [

	^ self outgoingAt: #return
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> return: aNode [

	^ self outgoingAt: #return put: aNode
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> slurp [

	| ins |
	ins := self flowIncoming collect: #state as: LinkedList.
	state := ins removeLast copy.
	[ ins isEmpty ] whileFalse: [ state := state join: ins removeLast ]
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> slurpAndBurp [

	self flowIncoming ifEmpty: [ ^ false ].
	self slurp.
	self transfer.
	^ self burp
]

{ #category : #accessing }
TypInfFlowNode >> transfer [

	"transfer the given state from in to out"

	
]
