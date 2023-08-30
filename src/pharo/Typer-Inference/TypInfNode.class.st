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
	state at: aNode covariantPut: aType.
	aNode constrainTo: aType from: self
]

{ #category : #accessing }
TypInfNode >> constrainTo: aType from: aNode [
	| edge |
	edge := aNode out
			at: #constrain
			ifPresent: [ :s | 
				s
					detect: [ :e | e target = self ]
					ifNone: [ aNode outAdd: (TypInfConstrainEdge origin: aNode target: self) ] ]
			ifAbsent: [ aNode outAdd: (TypInfConstrainEdge origin: aNode target: self) ].
	edge type: aType.
	aNode state at: self put: aType
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

{ #category : #accessing }
TypInfNode >> inNexts [
	^ in
		at: #next
		ifPresent: [ :s | s collect: #origin ]
		ifAbsent: [ #() ]
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
	| queue changed done |
	queue := LinkedList with: self.
	changed := false.
	done := IdentitySet new.
	[ queue isEmpty ]
		whileFalse: [ | current |
			current := queue removeFirst.
			current canSlurpAndBurp
				ifTrue: [ changed := current slurpAndBurp or: changed.
					done add: current.
					queue addAll: (current outNexts reject: [ :n | done includes: n ]) ]
				ifFalse: [ (done includes: current) ifFalse: [ queue add: self ] ] ].
	^ changed
]

{ #category : #accessing }
TypInfNode >> iterateDiff [
	| queue changes current |
	queue := LinkedList with: self.
	changes := OrderedIdentityDictionary new.
	[ queue isEmpty ]
		whileFalse: [ current := queue removeFirst.
			current canSlurpAndBurp
				ifTrue: [ current slurpAndBurpDiff ifNotEmpty: [ :c | changes at: current put: c ].
					queue addAll: current outNexts ]
				ifFalse: [ queue ifEmpty: [ ^ changes ].
					queue add: self ] ].
	^ changes isEmpty
]

{ #category : #accessing }
TypInfNode >> iterateWithContinuations: aSequenceableCollection [
	| changed |
	self canSlurpAndBurp
		ifFalse: [ aSequenceableCollection ifEmpty: [ ^ false ].
			aSequenceableCollection add: self.
			^ aSequenceableCollection removeFirst
				iterateWithContinuations: aSequenceableCollection ].
	changed := self slurpAndBurp.
	^ out
		at: #next
		ifPresent: [ :s | 
			s
				inject: changed
				into: [ :r :e | r or: (e target iterateWithContinuations: aSequenceableCollection) ] ]
		ifAbsent: [ changed ]
]

{ #category : #accessing }
TypInfNode >> methodNode [

	^ context root
]

{ #category : #accessing }
TypInfNode >> newMethodLookup: aMessage [
	^ TypMethodLookup
		receiver: aMessage constrainedReceiver
		selector: aMessage selector
		arguments: aMessage arguments
		parent: nil
]

{ #category : #accessing }
TypInfNode >> node [
	^ node
]

{ #category : #accessing }
TypInfNode >> outNexts [
	^ out
		at: #next
		ifPresent: [ :s | s collect: #target ]
		ifAbsent: [ #() ]
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
			state := first slurp copy.
			(s copyWithout: first) do: [ :e | state := state covariant: e state ] ].
	in
		at: #constrain
		ifPresent: [ :s | 
			state
				at: self
				put: ((s
						collect: [ :e | 
							state
								at: e
								ifPresent: [ :t | e type covariant: t ]
								ifAbsent: [ e type ] ])
						, {state at: self ifAbsent: TypUnknownType instance}
						reduce: [ :a :b | b covariant: a ]) ].
	out at: #constrain ifPresent: [ :s | s copy do: #remove ]
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
	transferred := true.
	^ state ~= oldState
]

{ #category : #accessing }
TypInfNode >> slurpAndBurpDiff [
	"generates state diff per node instead of just changed or not.
	useful for debugging"

	| oldState |
	self assert: [ self canSlurpAndBurp ].
	oldState := state copy.
	self
		slurp;
		transfer;
		burp.
	transferred := true.
	^ oldState diff: state
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
	^ state at: self ifAbsent: TypUnknownType instance
]

{ #category : #accessing }
TypInfNode >> unconstrain: aNode [
	aNode unconstrainFrom: self
]

{ #category : #accessing }
TypInfNode >> unconstrainFrom: aNode [
	aNode out
		at: #constrain
		ifPresent: [ :s | s select: [ :e | e target = self ] thenDo: #remove ]
]

{ #category : #accessing }
TypInfNode >> uninstall [
	self edges do: #remove.
	self flag: 'TODO what else?'
]
