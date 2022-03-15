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

	outgoing at: #next ifPresent: [ :s | 
		s do: [ :n | (n state: state copy) ifTrue: [ changed := true ] ] ]
]

{ #category : #'as yet unclassified' }
TypInfNode >> constrain [

	| type |
	type := state at: self.
	incoming
		at: #constrain
		ifPresent: [ :s | 
			s ifNotEmpty: [ 
				state
					at: self
					put:
					(s
						 inject: (state at: self)
						 into: [ :r :e | r asNarrower: e type ]) ] ]
		ifAbsent: [  ].
	TypInfSignal
		emitMessage: 'constrain'
		from: type
		to: (state at: self)
		node: self
]

{ #category : #accessing }
TypInfNode >> constrain: aNode to: aType [

	| typeOld typeNew |
	aType isUnknown ifTrue: [ 
		^ self "generalizing to the top type is not a constraint" ].
	typeOld := state at: aNode.
	typeNew := typeOld asNarrower: aType.
	typeNew = typeOld ifTrue: [ 
		^ self "if unchanged, we need no further constraints" ].
	state at: aNode put: typeNew.
	TypInfSignal
		emitMessage: 'constrain:to:'
		from: typeOld
		to: typeNew
		node: self -> aNode.
	outgoing
		at: #constrain
		ifPresent: [ :s | 
			s
				detect: [ :e | e target == aNode ]
				ifFound: [ :e | 
					(e type: typeNew) ifTrue: [ 
						aNode constrainTo: typeNew.
						changed := true ] ]
				ifNone: [ 
					self outgoingAdd:
						(TypInfConstrainEdge origin: self target: aNode type: typeNew).
					aNode constrainTo: typeNew.
					changed := true ] ]
		ifAbsent: [ 
			self outgoingAdd:
				(TypInfConstrainEdge origin: self target: aNode type: typeNew).
			aNode constrainTo: typeNew.
			changed := true ]
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

	changed := false.
	self
		slurp;
		constrain;
		transfer;
		burp.
	[ ^ changed or: state changed ] ensure: [ changed := false ]
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
