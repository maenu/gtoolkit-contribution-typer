Class {
	#name : #TypInfNode,
	#superclass : #TypNode,
	#instVars : [
		'node',
		'state',
		'context',
		'transferred'
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
		ifAbsent: [ state isNotNil ]
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
TypInfNode >> contextNodesEqualsNextNodes [
	| queue blacks current a b |
	queue := LinkedList with: context home root.
	blacks := IdentitySet new.
	[ queue isEmpty ]
		whileFalse: [ current := queue removeFirst.
			current out
				at: #next
				ifPresent: [ :s | s do: [ :e | (blacks includes: e target) ifFalse: [ queue add: e target ] ] ].
			blacks add: current ].
	a := context home nodes values flatCollect: #yourself as: IdentitySet.
	b := blacks.
	self assert: [ (b difference: a) isEmpty ].
	self assert: [ (a difference: b) isEmpty ]
]

{ #category : #accessing }
TypInfNode >> depthFirstNextDo: aBlock [
	^ self depthFirstNextDo: aBlock skipping: IdentitySet new
]

{ #category : #accessing }
TypInfNode >> depthFirstNextDo: aBlock skipping: anIdentitySet [
	(anIdentitySet includes: self) ifTrue: [ ^ self ].
	anIdentitySet add: self.
	aBlock value: self.
	out
		at: #next
		ifPresent: [ :c | c do: [ :e | e target depthFirstNextDo: aBlock skipping: anIdentitySet ] ]
]

{ #category : #accessing }
TypInfNode >> depthFirstNextReverseDo: aBlock [
	^ self depthFirstNextReverseDo: aBlock skipping: IdentitySet new
]

{ #category : #accessing }
TypInfNode >> depthFirstNextReverseDo: aBlock skipping: anIdentitySet [
	(anIdentitySet includes: self) ifTrue: [ ^ self ].
	anIdentitySet add: self.
	aBlock value: self.
	in
		at: #next
		ifPresent: [ :c | c do: [ :e | e origin depthFirstNextReverseDo: aBlock skipping: anIdentitySet ] ]
]

{ #category : #initialization }
TypInfNode >> initializeNode: aNode context: aContext [
	self assert: [ aContext state isNotNil ].
	transferred := false.
	node := aNode.
	context := aContext.
	state := aContext state.
	state at: self put: TypUnknownType instance
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
TypInfNode >> iterate [
	| changed |
	changed := false.
	self
		depthFirstNextDo: [ :n | n canSlurpAndBurp ifTrue: [ changed := n slurpAndBurp or: changed ] ].
	^ changed
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
			self assert: [ state isNotNil ].
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
								ifAbsent: [ e type ] ])
						, {state at: self ifAbsent: TypUnknownType instance}
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
	transferred := true.	"quick check for most probable change for performance"
	(oldState at: self) = (state at: self) ifFalse: [ ^ false ].
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
TypInfNode >> transferred [
	^ transferred
]

{ #category : #accessing }
TypInfNode >> type [
	^ state at: self
]

{ #category : #accessing }
TypInfNode >> uninstall [
	self edges do: #remove.
	self flag: 'TODO what else?'
]
