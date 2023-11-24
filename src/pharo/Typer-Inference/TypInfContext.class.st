Class {
	#name : #TypInfContext,
	#superclass : #TypNode,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#instVars : [
		'sender',
		'node',
		'state',
		'root',
		'current',
		'nodes',
		'iterations',
		'children',
		'nodeStackDepth',
		'lookup'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfContext class >> sender: aContext state: aState node: aNode lookup: aLookup [
	^ self new
		initializeSender: aContext
			state: aState
			node: aNode
			lookup: aLookup;
		yourself
]

{ #category : #accessing }
TypInfContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	sender = anObject sender ifFalse: [ ^ false ].
	node = anObject node ifFalse: [ ^ false ].
	lookup = anObject lookup ifFalse: [ ^ false ].
	^ true
]

{ #category : #accessing }
TypInfContext >> absorb: aContext [
	lookup := lookup absorbed: aContext lookup
]

{ #category : #accessing }
TypInfContext >> add: aNode [
	nodes
		at: aNode node
		ifPresent: [ :c | c add: aNode ]
		ifAbsent: [ nodes at: aNode node put: (OrderedCollection with: aNode) ].
	^ aNode
]

{ #category : #accessing }
TypInfContext >> allChildren [
	^ (children flatCollect: #allChildren) , {self}
]

{ #category : #accessing }
TypInfContext >> allNodes [
	^ self allChildren flatCollect: [ :e | e nodes flatCollect: #yourself ]
]

{ #category : #accessing }
TypInfContext >> canAbsorb: aContext [
	aContext class = self class ifFalse: [ ^ false ].
	^ lookup canAbsorb: aContext lookup
]

{ #category : #accessing }
TypInfContext >> children [
	^ children
]

{ #category : #accessing }
TypInfContext >> definition: aLocalNode [
	nodes
		at: aLocalNode variable definingNode
		ifPresent: [ :c | 
			self assert: [ c size = 1 ].
			^ c anyOne ].
	sender ifNotNil: [ ^ sender definition: aLocalNode ].
	Error signal: 'no definition found'
]

{ #category : #accessing }
TypInfContext >> handles: anExceptionType [
	^ false
]

{ #category : #accessing }
TypInfContext >> hash [
	^ (sender hash bitXor: node hash) bitXor: lookup hash
]

{ #category : #origins }
TypInfContext >> home [
	^ sender ifNil: self ifNotNil: #home
]

{ #category : #accessing }
TypInfContext >> initializeSender: aContext state: aState node: aNode lookup: aLookup [
	sender := aContext.
	state := aState copy.
	node := aNode.
	lookup := aLookup.
	iterations := OrderedCollection
			new: TypInfCurrentConfiguration value maxIterations + 1.
	nodes := IdentityDictionary new.
	children := IdentitySet new
]

{ #category : #accessing }
TypInfContext >> install [
	self assert: [ root isNil ].
	self assert: [ current isNil ].
	self assert: [ iterations isEmpty ].
	current := root := self add: (node typInfRootNodeInContext: self).
	node acceptVisitor: self
]

{ #category : #accessing }
TypInfContext >> isStable [
	^ iterations size < TypInfCurrentConfiguration value maxIterations
]

{ #category : #running }
TypInfContext >> iterate [
	self install.
	TypInfNodeStack
		push: node
		during: [ | iteration queue done |
			nodeStackDepth := TypInfNodeStack actives size.
			[ TypInfNodeIterateSignal emit: self.
			iteration := OrderedIdentityDictionary new.
			queue := LinkedList with: root.
			done := IdentitySet new.
			[ queue isEmpty ]
				whileFalse: [ | currentNode |
					currentNode := queue removeLast.
					(done includes: currentNode)
						ifFalse: [ currentNode slurpAndTransfer
								ifNotEmpty: [ :c | iteration at: currentNode put: c ].
							done add: currentNode.
							queue addAll: currentNode outNexts ] ].
			iterations add: iteration.
			iterations size <= TypInfCurrentConfiguration value maxIterations
				and: [ iteration isNotEmpty ] ] whileTrue ]
		or: [ self error: 'cannot push node' ].
	[ self perform: TypInfCurrentConfiguration value afterContextIterate ]
		typAsAsyncFuture typAwait
]

{ #category : #accessing }
TypInfContext >> iterations [
	^ iterations
]

{ #category : #accessing }
TypInfContext >> lookup [
	^ lookup
]

{ #category : #accessing }
TypInfContext >> next: aNode [
	^ self nextEdgeTo: (aNode typInfNodeInContext: self)
]

{ #category : #accessing }
TypInfContext >> nextEdgeTo: aNode [
	self assert: [ aNode isKindOf: TypInfNode ].
	self add: aNode.
	current outAdd: (TypInfNextEdge origin: current target: aNode).
	^ current := aNode
]

{ #category : #accessing }
TypInfContext >> node [
	^ node
]

{ #category : #accessing }
TypInfContext >> nodeStackDepth [
	^ nodeStackDepth
]

{ #category : #accessing }
TypInfContext >> nodes [
	^ nodes
]

{ #category : #accessing }
TypInfContext >> nodesAt: aNode [
	^ (nodes at: aNode ifAbsent: [ OrderedCollection new ])
		, (children flatCollect: [ :c | c nodesAt: aNode ] as: OrderedCollection)
]

{ #category : #accessing }
TypInfContext >> printOn: aStream [
	node printOn: aStream
]

{ #category : #accessing }
TypInfContext >> receiver: aNode [
	^ nodes
		at: aNode
		ifPresent: #last
		ifAbsent: [ Error signal: 'no receiver found' ]
]

{ #category : #accessing }
TypInfContext >> reduce [
	| allNodes |
	iterations := iterations collect: [ :s | nil ].
	allNodes := self allNodes.
	allNodes do: [ :e | e reduceTo: allNodes ]
]

{ #category : #accessing }
TypInfContext >> root [
	^ root
]

{ #category : #running }
TypInfContext >> run [
	| start stop tally |
	start := TypInfContextStartSignal node: self.
	start emit.
	(TypInfCurrentConfiguration value wantsTally
		and: [ MessageTally typInfIsRunning not ])
		ifTrue: [ tally := MessageTally new
					spyEvery: 1 on: [ self iterate ];
					yourself ]
		ifFalse: [ self iterate ].
	stop := TypInfContextStopSignal
			node: self
			start: start
			tally: tally.
	stop emit
]

{ #category : #accessing }
TypInfContext >> self [
	^ lookup self
]

{ #category : #accessing }
TypInfContext >> sender [
	^ sender
]

{ #category : #accessing }
TypInfContext >> stackDo: aBlock [
	aBlock value: self.
	sender ifNotNil: [ sender stackDo: aBlock ]
]

{ #category : #accessing }
TypInfContext >> stackSize [
	^ (sender ifNil: 0 ifNotNil: #stackSize) + 1
]

{ #category : #accessing }
TypInfContext >> state [
	^ state
]

{ #category : #accessing }
TypInfContext >> super [
	^ lookup super
]

{ #category : #'as yet unclassified' }
TypInfContext >> type [
	root ifNotNil: [ ^ root type ].
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: (node arguments collect: [ :n | TypUnknownType instance ])
]

{ #category : #accessing }
TypInfContext >> type: aNode [
	^ (self nodesAt: self) typAsMinimizedType
]

{ #category : #accessing }
TypInfContext >> typeAt: aNode [
	^ ((self nodesAt: aNode) collect: #type)
		ifEmpty: TypUnknownType instance
		ifNotEmpty: #typAsMinimizedType
]

{ #category : #accessing }
TypInfContext >> uninstall [
	(nodes values flatCollect: #yourself) do: #uninstall.
	nodes removeAll.
	iterations removeAll.
	current := root := nil
]

{ #category : #visiting }
TypInfContext >> visitArrayNode: anArrayNode [

	| arguments |
	arguments := anArrayNode statements collect: [ :n | 
		             self visitNode: n ].
	self next: anArrayNode.
	current inArguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfContext >> visitAssignmentNode: anAssignmentNode [

	self visitNode: anAssignmentNode value.
	self next: anAssignmentNode.
	self visitNode: anAssignmentNode variable.
	^ current
]

{ #category : #visiting }
TypInfContext >> visitBlockNode: aBlockNode [
	^ self next: aBlockNode
]

{ #category : #visiting }
TypInfContext >> visitCascadeNode: aCascadeNode [

	aCascadeNode messages do: [ :e | self visitNode: e ].
	^ self next: aCascadeNode
]

{ #category : #visiting }
TypInfContext >> visitLiteralArrayNode: aLiteralArrayNode [

	| arguments |
	arguments := aLiteralArrayNode contents collect: [ :n | 
		             self visitNode: n ].
	self next: aLiteralArrayNode.
	current inArguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfContext >> visitLiteralValueNode: aNode [

	^ self next: aNode
]

{ #category : #visiting }
TypInfContext >> visitLocalVariableNode: aLocalNode [
	self visitTemporaryNode: aLocalNode.
	aLocalNode isDefinition
		ifFalse: [ current inRead: (self definition: aLocalNode) ].
	^ current
]

{ #category : #visiting }
TypInfContext >> visitMessageNode: aMessageNode [
	| arguments |
	(aMessageNode isCascaded not or: [ aMessageNode isFirstCascaded ])
		ifTrue: [ self visitNode: aMessageNode receiver ].
	arguments := aMessageNode arguments collect: [ :n | self visitNode: n ].
	self next: aMessageNode.
	current inArguments: arguments.
	current inReceiver: (self receiver: aMessageNode receiver).
	^ current
]

{ #category : #visiting }
TypInfContext >> visitMethodNode: aMethodNode [
	current inArguments: (aMethodNode arguments collect: [ :n | self next: n ]).
	aMethodNode pragmas do: [ :each | self visitNode: each ].
	self visitNode: aMethodNode body.
	aMethodNode lastIsReturn
		ifFalse: [ self next: RBVariableNode selfNode.
			current outAdd: (TypInfReturnEdge origin: current target: root) ].
	^ root
]

{ #category : #visiting }
TypInfContext >> visitNode: aNode [ 
	^aNode acceptVisitor: self
]

{ #category : #visiting }
TypInfContext >> visitParseErrorNode: anErrorNode [
	^ self next: anErrorNode
]

{ #category : #accessing }
TypInfContext >> visitPragmaNode: aPragmaNode [
	| variable |
	aPragmaNode arguments do: [ :each | self visitNode: each ].
	aPragmaNode isPrimitiveError ifFalse: [ ^ self ].
	variable := (node scope lookupVar: aPragmaNode primitiveErrorVariableName)
			definingNode.
	self visitNode: variable
]

{ #category : #visiting }
TypInfContext >> visitReturnNode: aReturnNode [
	self visitNode: aReturnNode value.
	current outAdd: (TypInfReturnEdge origin: current target: root)
]

{ #category : #visiting }
TypInfContext >> visitSequenceNode: aSequenceNode [
	self next: aSequenceNode.
	current
		inArguments: (aSequenceNode temporaries collect: [ :n | self next: n ]).
	aSequenceNode statements do: [ :n | self visitNode: n ]
]

{ #category : #visiting }
TypInfContext >> visitVariableNode: aVariableNode [

	^ self next: aVariableNode
]
