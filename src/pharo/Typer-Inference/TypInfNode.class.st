Class {
	#name : #TypInfNode,
	#superclass : #TypNode,
	#instVars : [
		'node',
		'state',
		'changed'
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

	^ (self outgoingFlow
		   inject: false
		   into: [ :r :e | r or: (e state: state copy) ]) or: changed
]

{ #category : #'as yet unclassified' }
TypInfNode >> constrain [

	incoming
		at: #constrain
		ifPresent: [ :s | 
			s ifNotEmpty: [ 
				state
					at: self
					put:
					(s inject: (state at: self) into: [ :r :e | r with: e type ]) ] ]
		ifAbsent: [  ].
	outgoing
		at: #constrain
		ifPresent: [ :s | s copy do: [ :e | self outgoingRemove: e ] ]
		ifAbsent: [ "noop" ]
]

{ #category : #'as yet unclassified' }
TypInfNode >> constrain: aNode to: aType [

	| type |
	aType isUnknown ifTrue: [ ^ self ].
	changed := true.
	type := state at: aNode put: ((state at: aNode) with: aType).
	aNode constrainTo: type.
	outgoing
		at: #constrain
		ifPresent: [ :s | 
			s
				detect: [ :e | e target == aNode ]
				ifFound: [ :e | e type: type ]
				ifNone: [ 
					self outgoingAdd:
						(TypInfConstrainEdge origin: self target: aNode type: type) ] ]
		ifAbsent: [ 
			self outgoingAdd:
				(TypInfConstrainEdge origin: self target: aNode type: type) ]
]

{ #category : #'as yet unclassified' }
TypInfNode >> constrainTo: aType [

	
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
		  (e isKindOf: TypInfEdge) and: [ e isFlow ] ]
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

	| states |
	changed := false.
	states := self incomingFlow collect: #state as: LinkedList.
	states ifEmpty: [ ^ self ].
	state := states removeLast copy.
	[ states isEmpty ] whileFalse: [ 
		state := state join: states removeLast ]
]

{ #category : #accessing }
TypInfNode >> slurpAndBurp [

	^ self
		  slurp;
		  constrain;
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
