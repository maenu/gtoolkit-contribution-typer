Class {
	#name : #TypInfBlockContext,
	#superclass : #TypInfInlineContext,
	#instVars : [
		'block'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfBlockContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessageNode [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfBlockContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessage block: aBlock [
	^ self new
		initializeSender: aContext
			state: aState
			node: aNode
			self: aType
			super: anotherType;
		initializeMessage: aMessage;
		initializeBlock: aBlock;
		yourself
]

{ #category : #accessing }
TypInfBlockContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ block = anObject block
]

{ #category : #accessing }
TypInfBlockContext >> block [
	^ block
]

{ #category : #accessing }
TypInfBlockContext >> canInstall [
	^ self stackSize < 4
]

{ #category : #accessing }
TypInfBlockContext >> findInRead: aVariable [
	aVariable
		depthFirstNextReverseDo: [ :n | n node == aVariable node variable definingNode ifTrue: [ ^ n ] ].
	block
		depthFirstNextReverseDo: [ :n | n node == aVariable node variable definingNode ifTrue: [ ^ n ] ].
	self flag: 'Q why can we end up here?'.
	self home root
		depthFirstNextDo: [ :n | n node == aVariable node variable definingNode ifTrue: [ ^ n ] ].
	Error signal: 'no read found'
]

{ #category : #accessing }
TypInfBlockContext >> hash [
	^ super hash bitXor: block hash
]

{ #category : #accessing }
TypInfBlockContext >> home [
	^ block context home
]

{ #category : #accessing }
TypInfBlockContext >> initializeBlock: aBlock [
	block := aBlock
]

{ #category : #accessing }
TypInfBlockContext >> newRoot [
	^ TypInfInlinedBlock node: node context: self
]

{ #category : #accessing }
TypInfBlockContext >> stackSize [
	^ (super stackSize max: block context stackSize) + 1
]

{ #category : #accessing }
TypInfBlockContext >> visitNode [
	message outAdd: (TypInfNextEdge origin: message target: root).
	root outAt: #definition put: block.
	current
		inArguments: (node arguments
				withIndexCollect: [ :n :i | 
					i <= message inArguments size
						ifTrue: [ self
								nextEdgeTo: (TypInfInlinedLocalDefinition
										node: n
										context: self
										proxy: (message inArguments at: i)) ]
						ifFalse: [ self next: n	"can happen for function receiver types" ] ]).
	self visitNode: node body.
	node body lastIsReturn
		ifTrue: [ current outAdd: (TypInfReturnEdge origin: current target: block context root) ]
		ifFalse: [ current outAdd: (TypInfReturnEdge origin: current target: root) ].
	current
		outAdd: (TypInfNextEdge origin: current target: (message outAt: #nextOriginal))
]

{ #category : #accessing }
TypInfBlockContext >> visitReturnNode: aReturnNode [
	self visitNode: aReturnNode value.
	self next: aReturnNode.
	current outAdd: (TypInfReturnEdge origin: current target: block context root)
]
