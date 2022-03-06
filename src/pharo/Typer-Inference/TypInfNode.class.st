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

	^ (self outgoingFlow reject: [ :e | e key = #constrain ])
		  inject: false
		  into: [ :r :e | r or: (e state: state copy) ]
]

{ #category : #'as yet unclassified' }
TypInfNode >> constrain: aNode [

	| add |
	add := [ 
	       self outgoingAdd:
		       ((TypInfEdge origin: self target: aNode key: #constrain)
			        state: (TypInfState self: state self super: state super);
			        yourself) ].
	^ outgoing
		  at: #constrain
		  ifPresent: [ :s | 
		  s detect: [ :e | e target == aNode ] ifNone: add ]
		  ifAbsent: add
]

{ #category : #'as yet unclassified' }
TypInfNode >> constrain: aNode to: aType [

	(self constrain: aNode) state at: aNode put: aType
]

{ #category : #accessing }
TypInfNode >> constrainTo: aType [

	| type |
	type := state at: self.
	aType >= ProtoObject typAsType ifTrue: [ ^ false ].
	aType >= type ifTrue: [ ^ false ].
	type := type > aType
		        ifTrue: [ aType ]
		        ifFalse: [ type with: aType ].
	state at: self put: type.
	^ true
]

{ #category : #accessing }
TypInfNode >> context [

	^ self incomingAt: node
]

{ #category : #'as yet unclassified' }
TypInfNode >> incomingFlow [

	^ self incoming select: [ :e | 
		  (e isKindOf: TypInfEdge) and: [ e isFlowIn ] ]
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

	self flag: 'FIXME'
	"^ selfType <= aClassAnnouncement classAffected typAsType"
]

{ #category : #accessing }
TypInfNode >> invalidateOnMethodChange: aMethodAnnouncement [

	self flag: 'FIXME'
	"^ selfType <= aMethodAnnouncement methodAffected methodClass typAsType"
]

{ #category : #accessing }
TypInfNode >> node [
	^ node
]

{ #category : #accessing }
TypInfNode >> outgoingAddTarget: aNode key: anObject [

	self outgoingAdd:
		(TypInfEdge origin: self target: aNode key: anObject).
	^ aNode
]

{ #category : #'as yet unclassified' }
TypInfNode >> outgoingFlow [

	^ self outgoing select: [ :e | 
		  (e isKindOf: TypInfEdge) and: [ e isFlowOut ] ]
]

{ #category : #accessing }
TypInfNode >> outgoingNext [

	^ self outgoingAt: #next
]

{ #category : #accessing }
TypInfNode >> outgoingNext: aNode [

	^ self outgoingAt: #next put: aNode
]

{ #category : #'as yet unclassified' }
TypInfNode >> outgoingReturn [

	^ self outgoingAt: #return
]

{ #category : #'as yet unclassified' }
TypInfNode >> outgoingReturn: aNode [

	^ self outgoingAt: #return put: aNode
]

{ #category : #'as yet unclassified' }
TypInfNode >> outgoingReturnBlock [

	^ self outgoingAt: #returnBlock
]

{ #category : #'as yet unclassified' }
TypInfNode >> outgoingReturnBlock: aNode [

	^ self outgoingAt: #returnBlock put: aNode
]

{ #category : #printing }
TypInfNode >> printOn: aStream [

	aStream nextPutAll: (node printStringLimitedTo: 32)
]

{ #category : #'as yet unclassified' }
TypInfNode >> slurp [

	| ins |
	ins := self incomingFlow collect: #state as: LinkedList.
	self flag:
		'TODO differentiate between constrain and non-constrain, use #constrainTo:, delete edge?'.
	state := ins removeLast copy.
	[ ins isEmpty ] whileFalse: [ state := state join: ins removeLast ]
]

{ #category : #accessing }
TypInfNode >> slurpAndBurp [

	self incomingFlow ifEmpty: [ ^ false ].
	^ self
		  slurp;
		  transfer; 
		  burp
]

{ #category : #accessing }
TypInfNode >> state [

	^ state
]

{ #category : #accessing }
TypInfNode >> transfer [

	"transfer the given state from in to out"

	
]

{ #category : #accessing }
TypInfNode >> type [

	^ state at: self
]

{ #category : #accessing }
TypInfNode >> type: aType [

	^ state at: self put: aType
]
