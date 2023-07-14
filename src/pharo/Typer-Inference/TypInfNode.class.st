Class {
	#name : #TypInfNode,
	#superclass : #TypNode,
	#instVars : [
		'node',
		'state',
		'context',
		'oldState'
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
	out at: #next ifPresent: [ :s | s do: [ :n | n state: state copy ] ]
]

{ #category : #accessing }
TypInfNode >> context [

	^ context
]

{ #category : #accessing }
TypInfNode >> initialize [
	super initialize.
	state := TypInfState new.
	oldState := TypInfState new
]

{ #category : #accessing }
TypInfNode >> initialize: aState [
	"compute initial state for node"

	state := aState.
	state at: self put: TypUnknownType instance
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
TypInfNode >> methodNode [

	^ context root
]

{ #category : #accessing }
TypInfNode >> node [
	^ node
]

{ #category : #accessing }
TypInfNode >> oldState [

	^ oldState
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
			s
				ifNotEmpty: [ state := ((s collect: #state) reduce: [ :a :b | a covariant: b ]) copy ] ]
]

{ #category : #accessing }
TypInfNode >> slurpAndBurp [
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
