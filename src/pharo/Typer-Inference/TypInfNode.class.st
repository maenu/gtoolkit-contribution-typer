Class {
	#name : #TypInfNode,
	#superclass : #TypNode,
	#instVars : [
		'node',
		'state',
		'context',
		'transfers'
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
TypInfNode >> allNextNodes [
	| result |
	result := IdentitySet new.
	self depthFirstNextDo: [ :n | result add: n ].
	^ result
]

{ #category : #accessing }
TypInfNode >> changesDiffFrom: aState [
	"generates state diff per node instead of just changed or not.
	useful for debugging"

	^ aState diff: state
]

{ #category : #accessing }
TypInfNode >> changesFrom: aState [
	^ aState = state ifTrue: [ #() ] ifFalse: [ {nil} ]
]

{ #category : #accessing }
TypInfNode >> constrain: aNode to: aType [
	state at: aNode put: aType.
	aNode constrainTo: aType from: self
]

{ #category : #accessing }
TypInfNode >> constrainTo: aType from: aNode [
	| edge |
	aType isUnknown ifTrue: [ ^ self ].
	edge := aNode out
			at: #constrain
			ifPresent: [ :s | 
				s
					detect: [ :e | e target = self ]
					ifNone: [ aNode outAdd: (TypInfConstrainEdge origin: aNode target: self) ] ]
			ifAbsent: [ aNode outAdd: (TypInfConstrainEdge origin: aNode target: self) ].
	edge type: aType
]

{ #category : #accessing }
TypInfNode >> context [

	^ context
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

{ #category : #accessing }
TypInfNode >> inReturnType [
	^ (in
		at: #return
		ifPresent: [ :s | s reject: [ :e | e origin isDead ] thenCollect: [ :e | e origin type ] ]
		ifAbsent: [ #() ]) typAsMinimizedType
]

{ #category : #accessing }
TypInfNode >> inSignalType [
	^ in
		at: #signal
		ifPresent: [ :s | 
			(s reject: [ :e | e origin isDead ])
				ifEmpty: [ nil ]
				ifNotEmpty: [ :ss | (ss collect: #exception) typAsType ] ]
		ifAbsent: [ nil ]
]

{ #category : #initialization }
TypInfNode >> initializeNode: aNode context: aContext [
	self assert: [ aContext state isNotNil ].
	transfers := 0.
	node := aNode.
	context := aContext.
	state := aContext state withNode: self
]

{ #category : #accessing }
TypInfNode >> isDead [
	self depthFirstNextReverseDo: [ :n | n == context root ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
TypInfNode >> isLeaf [
	^ self outNexts isEmpty
]

{ #category : #accessing }
TypInfNode >> isLeaf: aContext [
	(context stack includes: aContext) ifFalse: [ ^ false ].
	^ self outNexts noneSatisfy: [ :n | n context stack includes: aContext ]
]

{ #category : #accessing }
TypInfNode >> iterate [
	| queue changes done |
	TypInfNodeIterateSignal emit: self.
	queue := LinkedList with: self.
	changes := OrderedIdentityDictionary new.
	done := IdentitySet new.
	[ queue isEmpty ]
		whileFalse: [ | current |
			current := done add: queue removeFirst.
			(current slurpAndTransfer)
				ifNotEmpty: [ :c | changes at: current put: c ].
			queue addAll: (current outNexts reject: [ :n | done includes: n ]) ].
	^ changes
]

{ #category : #accessing }
TypInfNode >> iterations [
	^ context home iterations
		collect: [ :c | 
			c
				at: self
				"ifPresent: [ :cc | cc at: self ifAbsent: {} ]"
				ifAbsent: {} ]
]

{ #category : #accessing }
TypInfNode >> leaves [
	| result |
	result := IdentitySet new.
	self depthFirstNextDo: [ :n | n isLeaf ifTrue: [ result add: n ] ].
	^ result
]

{ #category : #accessing }
TypInfNode >> leaves: aContext [
	| result |
	result := IdentitySet new.
	self depthFirstNextDo: [ :n | (n isLeaf: aContext) ifTrue: [ result add: n ] ].
	^ result
]

{ #category : #accessing }
TypInfNode >> methodNode [

	^ context root
]

{ #category : #accessing }
TypInfNode >> newMethodLookups: aMessage [
	^ aMessage receiver types
		collect: [ :t | 
			TypMethodLookup
				receiver: t
				selector: aMessage selector
				arguments: aMessage arguments ]
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
	^ ((in at: #next)
		collect: [ :e | state at: e origin ifAbsent: [  "happens for recursion"e origin type ] ])
		typAsMinimizedType
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
			| states |
			states := (s collect: [ :e | e origin state ] as: OrderedCollection)
					sorted: [ :a :b | a size > b size ].
			state := states removeFirst withNode: self.
			state slurpAll: states ].
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
	out at: #constrain ifPresent: [ :s | s copy do: #remove ].
	state read removeAll
]

{ #category : #accessing }
TypInfNode >> slurpAndTransfer [
	| oldState |
	TypInfNodeSlurpAndTransferSignal emit: self.
	oldState := state.
	self
		slurp;
		transfer.
	transfers := transfers + 1.
	^ self perform: TypInfCurrentConfiguration value nodeChanges with: oldState
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
TypInfNode >> transfers [
	^ transfers
]

{ #category : #accessing }
TypInfNode >> type [
	^ state at: self ifAbsent: [ TypUnknownType instance ]
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
	self flag: 'TODO sounds expensive'.
	self edges do: #remove
]
