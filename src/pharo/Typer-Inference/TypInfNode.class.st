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

	^ outgoing
		  at: #next
		  ifPresent: [ :s | 
			  s inject: changed into: [ :r :e | r or: (e state: state copy) ] ]
		  ifAbsent: [ changed ]
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
					(s inject: (state at: self) into: [ :r :e | r asNarrower: e type ]) ] ]
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
	type := state at: aNode put: ((state at: aNode) asNarrower: aType).
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
TypInfNode >> outgoingNext [

	^ self outgoingAt: #next
]

{ #category : #printing }
TypInfNode >> printOn: aStream [

	aStream nextPutAll: (node printStringLimitedTo: 32)
]

{ #category : #'as yet unclassified' }
TypInfNode >> slurp [

	| states |
	changed := false.
	states := incoming
		          at: #next
		          ifPresent: [ :s | s collect: #state as: LinkedList ]
		          ifAbsent: [ ^ self ].
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
