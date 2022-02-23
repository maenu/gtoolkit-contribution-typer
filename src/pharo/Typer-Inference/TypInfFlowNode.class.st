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

{ #category : #'as yet unclassified' }
TypInfFlowNode >> burp: aState [

	^ self flowOutgoing
		  inject: false
		  into: [ :r :e | r or: (e state: aState copy) ]
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
TypInfFlowNode >> initialValueIn: aState [

	"compute initial state for node"

	^ TypUnknownType instance
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
TypInfFlowNode >> returnSelf [

	^ self outgoingAt: #returnSelf
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> returnSelf: aNode [

	^ self outgoingAt: #returnSelf put: aNode
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> slurp [

	| ins state |
	ins := self flowIncoming collect: #state as: LinkedList.
	state := ins removeLast.
	[ ins isEmpty ] whileFalse: [ state := state join: ins removeLast ].
	^ state
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> slurpAndBurp [

	self flowIncoming ifEmpty: [ ^ false ].
	state := self slurp.
	self transfer: state.
	^ self burp: state
]

{ #category : #accessing }
TypInfFlowNode >> transfer: aState [

	"transfer the given state from in to out"

	
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> typGtStateFor: aView [

	<gtView>
	state ifNil: [ ^ aView empty ].
	^ aView explicit
		  title: 'Type';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: (state at: self) ]
]
