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
TypInfFlowNode >> burp [

	self outgoingFlow do: [ :e | e type: type ]
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> incomingFlow [

	^ incoming select: [ :e | e isKindOf: TypInfFlowEdge ]
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

{ #category : #'as yet unclassified' }
TypInfFlowNode >> nodesFlow [

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

{ #category : #accessing }
TypInfFlowNode >> outgoingAddTarget: aNode data: anObject [

	^ self outgoingAdd:
		  (TypInfFlowEdge origin: self target: aNode data: anObject)
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> outgoingFlow [

	^ outgoing select: [ :e | e isKindOf: TypInfFlowEdge ]
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
TypInfFlowNode >> slurpAndBurp [

	| oldType |
	oldType := type.
	type := self slurp.
	self burp.
	^ oldType = type
]

{ #category : #accessing }
TypInfFlowNode >> state [

	^ state
]

{ #category : #accessing }
TypInfFlowNode >> state: anObject [

	state := anObject
]

{ #category : #accessing }
TypInfFlowNode >> type [

	self subclassResponsibility
]
