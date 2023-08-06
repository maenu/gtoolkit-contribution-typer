Class {
	#name : #TypInfNode,
	#superclass : #TypNode,
	#instVars : [
		'node',
		'state',
		'context'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfNode class >> node: aNode context: aContext [
	^ self new
		initializeNode: aNode context: aContext;
		yourself
]

{ #category : #accessing }
TypInfNode >> burp [
	out at: #next ifPresent: [ :s | s do: [ :n | n state: state ] ]
]

{ #category : #accessing }
TypInfNode >> canSlurpAndBurp [
	^ in
		at: #next
		ifPresent: [ :s | s allSatisfy: #canBeSlurped ]
		ifAbsent: [ true ]
]

{ #category : #accessing }
TypInfNode >> constrain: aNode to: aType [
	"ensures a constrain edge from self to aNode with a type."

	state at: aNode put: ((state at: aNode) covariant: aType).
	out
		at: #constrain
		ifPresent: [ :s | 
			s
				detect: [ :e | e target = aNode ]
				ifFound: [ :e | 
					e type: aType.
					^ e ] ].
	^ self
		outAdd: ((TypInfConstrainEdge origin: self target: aNode)
				type: aType;
				yourself)
]

{ #category : #accessing }
TypInfNode >> context [

	^ context
]

{ #category : #accessing }
TypInfNode >> diffSlurpAndBurp [
	"generates state diff per node instead of just changed or not.
	useful for debugging"

	| oldState |
	self assert: [ self canSlurpAndBurp ].
	oldState := state copy.
	self
		slurp;
		transfer;
		burp.
	^ state diff: oldState
]

{ #category : #accessing }
TypInfNode >> initialize: aState [
	"compute initial state for node"

	state := aState.
	state at: self put: TypUnknownType instance.
	out
		at: #next
		ifPresent: [ :s | s do: [ :e | e state: state ] ]
		ifAbsent: [  "noop" ]
]

{ #category : #initialization }
TypInfNode >> initializeNode: aNode context: aContext [
	node := aNode.
	context := aContext
]

{ #category : #accessing }
TypInfNode >> invalidateOnClassChange: aClassAnnouncement [

	^ self type invalidateOnClassChange: aClassAnnouncement
]

{ #category : #accessing }
TypInfNode >> invalidateOnMethodChange: aMethodAnnouncement [

	^ self type invalidateOnMethodChange: aMethodAnnouncement
]

{ #category : #accessing }
TypInfNode >> methodNestingLevel [
	^ self methodNode methodNestingLevel
]

{ #category : #accessing }
TypInfNode >> methodNode [

	^ context root
]

{ #category : #accessing }
TypInfNode >> node [
	^ node
]

{ #category : #accessing }
TypInfNode >> previous [
	^ ((in at: #next) collect: [ :e | state at: e origin ]) typAsType
]

{ #category : #printing }
TypInfNode >> printOn: aStream [

	aStream nextPutAll: (node printStringLimitedTo: 32)
]

{ #category : #accessing }
TypInfNode >> slurp [
	in
		at: #next
		ifPresent: [ :s | 
			| first |
			first := s anyOne.
			state := first state copy.
			(s copyWithout: first) do: [ :e | state := state covariant: e state ] ].
	in
		at: #constrain
		ifPresent: [ :s | 
			state
				at: self
				put: ((s
						collect: [ :e | 
							state index
								at: e
								ifPresent: [ :t | e type covariant: t ]
								ifAbsent: [ e type ] ]) , {state at: self}
						reduce: [ :a :b | b covariant: a ]) ]
]

{ #category : #accessing }
TypInfNode >> slurpAndBurp [
	| oldState |
	self assert: [ self canSlurpAndBurp ].
	oldState := state copy.
	self
		slurp;
		transfer;
		burp.
	^ state ~= oldState
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
