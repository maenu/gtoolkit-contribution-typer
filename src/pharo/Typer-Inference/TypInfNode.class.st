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
	TypInfSignal
		emitMessage: 'constrain start'
		from: nil
		to: nil
		node: self.
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
		emitMessage: 'constrain end'
		from: type
		to: (state at: self)
		node: self
]

{ #category : #accessing }
TypInfNode >> constrain: aNode to: aType in: aState [

	| typeOld typeNew |
	aType isUnknown ifTrue: [ 
		^ self "generalizing to the top type is not a constraint" ].
	typeOld := aState at: aNode.
	typeNew := typeOld asNarrower: aType.
	typeNew = typeOld ifTrue: [ 
		^ self "if unchanged, we need no further constraints" ].
	aState at: aNode put: typeNew.
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
						aNode constrainTo: typeNew in: aState.
						changed := true ] ]
				ifNone: [ 
					self outgoingAdd:
						(TypInfConstrainEdge origin: self target: aNode type: typeNew).
					aNode constrainTo: typeNew in: aState.
					changed := true ] ]
		ifAbsent: [ 
			self outgoingAdd:
				(TypInfConstrainEdge origin: self target: aNode type: typeNew).
			aNode constrainTo: typeNew in: aState.
			changed := true ]
]

{ #category : #'as yet unclassified' }
TypInfNode >> constrainTo: aType in: aState [

	
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
	TypInfSignal
		emitMessage: 'slurp start'
		from: nil
		to: nil
		node: self.
	states := incoming
		          at: #next
		          ifPresent: [ :s | s collect: #state as: LinkedList ]
		          ifAbsent: [ ^ self ].
	state := states removeLast copy.
	[ states isEmpty ] whileFalse: [ 
		state := state join: states removeLast ].
	TypInfSignal
		emitMessage: 'slurp end'
		from: nil
		to: nil
		node: self
]

{ #category : #accessing }
TypInfNode >> slurpAndBurp [

	| type |
	changed := false.
	type := state at: self.
	TypInfSignal
		emitMessage: 'slurpAndBurp start'
		from: type
		to: nil
		node: self.
	self
		slurp;
		constrain;
		transfer;
		burp.
	changed ifTrue: [ 
		TypInfSignal
			emitMessage: 'slurpAndBurp changed'
			from: type
			to: (state at: self)
			node: self ].
	state changed ifTrue: [ 
		TypInfSignal
			emitMessage: 'slurpAndBurp changed state'
			from: type
			to: (state at: self)
			node: self ].
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
