Class {
	#name : #TypInfContext,
	#superclass : #TypNode,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#instVars : [
		'sender',
		'node',
		'selfType',
		'superType',
		'state',
		'root',
		'current',
		'nodes',
		'iterationsDone',
		'iterationsMax',
		'iterations',
		'children',
		'nodeStackDepth'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType [
	^ self new
		initializeSender: aContext
			state: aState
			node: aNode
			self: aType
			super: anotherType;
		yourself
]

{ #category : #accessing }
TypInfContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	sender == anObject sender ifFalse: [ ^ false ].
	node == anObject node ifFalse: [ ^ false ].
	selfType = anObject self ifFalse: [ ^ false ].
	superType = anObject super ifFalse: [ ^ false ].
	^ true
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
TypInfContext >> children [
	^ children
]

{ #category : #accessing }
TypInfContext >> findInRead: aVariable [
	aVariable
		depthFirstNextReverseDo: [ :n | n node == aVariable node variable definingNode ifTrue: [ ^ n ] ].
	Error signal: 'no read found'
]

{ #category : #accessing }
TypInfContext >> handles: anExceptionType [
	^ false
]

{ #category : #accessing }
TypInfContext >> hash [
	^ ({sender.
		node.
		selfType.
		superType} collect: #hash) reduce: [ :r :e | r bitXor: e ]
]

{ #category : #origins }
TypInfContext >> home [
	^ sender ifNil: self ifNotNil: #home
]

{ #category : #accessing }
TypInfContext >> initializeSender: aContext state: aState node: aNode self: aType super: anotherType [
	self assert: [ aType isNotNil ].				
	sender := aContext.
	state := aState.
	node := aNode.
	selfType := aType.
	superType := anotherType.
	nodes := IdentityDictionary new.
	children := IdentitySet new.
	nodeStackDepth := TypInfNodeStack actives size.
	iterationsDone := 0.
	iterationsMax := 16.
	iterations := OrderedCollection new
]

{ #category : #accessing }
TypInfContext >> install [
	self assert: [ root isNil ].
	self assert: [ current isNil ].
	current := root := self add: (node typInfNodeInContext: self).
	node acceptVisitor: self
]

{ #category : #accessing }
TypInfContext >> iterations [
	^ iterations
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
TypInfContext >> returns: aContext [
	| cursors cursor done |
	cursors := IdentitySet with: root.
	done := IdentitySet new.
	[ cursors isNotEmpty and: [ (cursors difference: done) isNotEmpty ] ]
		whileTrue: [ cursor := (cursors difference: done) anyOne.
			cursor out
				at: #next
				ifPresent: [ :s | 
					s
						do: [ :e | 
							(cursors includes: e origin) ifTrue: [ cursors remove: e origin ].
							(e target context stack includes: self) ifTrue: [ cursors add: e target ] ] ]
				ifAbsent: [  "noop" ].
			done add: cursor ].
	^ cursors
		allSatisfy: [ :n | 
			n out
				at: #return
				ifPresent: [ :s | s anySatisfy: [ :e | e target == aContext root ] ]
				ifAbsent: [ false ] ]
]

{ #category : #accessing }
TypInfContext >> root [
	^ root
]

{ #category : #running }
TypInfContext >> run [
	self install.
	TypInfContextStartSignal emit: self.
	[ iterationsDone := iterationsDone + 1.
	iterationsDone <= iterationsMax and: [ root iterate ] ] whileTrue.
	TypInfContextStopSignal emit: self
]

{ #category : #running }
TypInfContext >> runDiff [
	self install.
	[ iterationsDone := iterationsDone + 1.
	iterationsDone <= iterationsMax
		and: [ | iteration |
			iteration := root iterateDiff.
			iterations add: iteration.
			iteration isNotEmpty ] ] whileTrue
]

{ #category : #accessing }
TypInfContext >> self [
	^ selfType
]

{ #category : #accessing }
TypInfContext >> sender [
	^ sender
]

{ #category : #accessing }
TypInfContext >> stack [
	^ (sender ifNil: {} ifNotNil: #stack) , {self}
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
	^ superType
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
	aLocalNode isDefinition ifFalse: [ current inRead: current findInRead ].
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
	current inReceiver: current findInReceiver.
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
