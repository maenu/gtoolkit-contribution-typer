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

	^ outgoing
		  at: #next
		  ifPresent: [ :s | 
		  s inject: false into: [ :r :e | r or: (e state: state copy) ] ]
		  ifAbsent: [ false ]
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

	incoming at: #next ifPresent: [ :s | 
		s ifNotEmpty: [ 
			state := (s collect: #state) reduce: [ :a :b | a join: b ].
			state := state copy "for good measure" ] ].
	incoming at: #tighten ifPresent: [ :s | 
		s ifNotEmpty: [ 
			| type |
			type := (s collect: [ :e | e getIn: state ]) reduce: [ :a :b | 
				        a tighten: b ].
			state at: self put: type ] ]
]

{ #category : #accessing }
TypInfNode >> slurpAndBurp [

	self
		slurp;
		transfer;
		burp
]

{ #category : #accessing }
TypInfNode >> state [

	^ state
]

{ #category : #'as yet unclassified' }
TypInfNode >> tighten: aState [

	incoming at: #tighten ifPresent: [ :s | 
		s ifNotEmpty: [ 
			| type |
			type := (s collect: [ :e | e getIn: aState ]) reduce: [ :a :b | 
				        a tighten: b ].
			aState at: self put: type ] ]
]

{ #category : #accessing }
TypInfNode >> tighten: aNode to: aType in: aState [

	| type edge |
	aType isUnknown ifTrue: [ 
		^ self "generalizing to the top type is not a constraint" ].
	type := (aState at: aNode) tighten: aType.
	aState at: aNode put: type.
	aNode tightenTo: type in: aState.
	edge := outgoing
		        at: #tighten
		        ifPresent: [ :s | 
			        s detect: [ :e | e target == aNode ] ifNone: [ 
				        self outgoingAdd:
					        (TypInfTightenEdge origin: self target: aNode type: type) ] ]
		        ifAbsent: [ 
			        self outgoingAdd:
				        (TypInfTightenEdge origin: self target: aNode type: type) ].
	edge set: type in: aState
]

{ #category : #'as yet unclassified' }
TypInfNode >> tightenTo: aType in: aState [

	
]

{ #category : #accessing }
TypInfNode >> transfer [

	"transfer the given state from in to out"

	incoming at: #tighten ifPresent: [ :s | 
		s
			select: #isReturn
			thenDo: [ :e | e set: (state at: self) in: state ] ]
]

{ #category : #accessing }
TypInfNode >> type [

	^ state at: self
]
