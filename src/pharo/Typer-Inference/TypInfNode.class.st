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

	^ self outgoingFlow
		  inject: false
		  into: [ :r :e | r or: (e state: state copy) ]
]

{ #category : #'as yet unclassified' }
TypInfNode >> constrainTo: aType in: aState [

	| type |
	"root is not constraining"
	aType >= ProtoObject typAsType ifTrue: [ ^ self ].
	type := aState at: self.
	(type isUnknown or: [ type > aType ]) ifTrue: [ 
		aState at: self put: aType ]
]

{ #category : #accessing }
TypInfNode >> context [

	^ self incomingAt: node
]

{ #category : #'as yet unclassified' }
TypInfNode >> incomingFlow [

	^ self incoming select: [ :e | 
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
TypInfNode >> outgoingAddTarget: aNode key: anObject [

	^ self outgoingAdd:
		  (TypInfEdge origin: self target: aNode key: anObject)
]

{ #category : #'as yet unclassified' }
TypInfNode >> outgoingFlow [

	^ self outgoing select: [ :e | 
		  (e isKindOf: TypInfEdge) and: [ e isFlow ] ]
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
	ins := self incomingFlow collect: #state as: LinkedList.
	state := ins removeLast copy.
	[ ins isEmpty ] whileFalse: [ state := state join: ins removeLast ]
]

{ #category : #'as yet unclassified' }
TypInfNode >> slurpAndBurp [

	self incomingFlow ifEmpty: [ ^ false ].
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

	^ self outgoingAt: #type ifAbsentPut: [ 
		  state
			  ifNil: [ TypUnknownType instance ]
			  ifNotNil: [ state at: self ] ]
]

{ #category : #accessing }
TypInfNode >> type: aNode [

	^ self outgoingAt: #type put: aNode
]
