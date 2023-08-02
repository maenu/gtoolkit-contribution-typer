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
		inlitializeSender: aContext
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
	super = anObject ifFalse: [ ^ false ].
	^ block = anObject block
]

{ #category : #accessing }
TypInfBlockContext >> block [
	^ block
]

{ #category : #accessing }
TypInfBlockContext >> canInstall [
	^ message methodNestingLevel < 5
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
TypInfBlockContext >> nodesAt: aNode [
	^ (super nodesAt: aNode) ifEmpty: [ block context nodesAt: aNode ]
]

{ #category : #accessing }
TypInfBlockContext >> visitNode [
	message outAdd: (TypInfNextEdge origin: message target: root).
	current
		inArguments: (node arguments
				withIndexCollect: [ :n :i | 
					| next |
					"basically #next:, but with special inf node"
					next := TypInfInlinedLocalDefinition
							node: n
							context: self
							proxy: (message inArguments at: i).
					self nodesAt: n add: next.
					current outAdd: (TypInfNextEdge origin: current target: next).
					current := next ]).
	self visitNode: node body.
	node body lastIsReturn
		ifTrue: [ current outAdd: (TypInfReturnEdge origin: current target: block context root) ]
		ifFalse: [ current outAdd: (TypInfReturnEdge origin: current target: root) ].
	message
		outAt: #nextOriginal
		ifPresent: [ :n | current outAdd: (TypInfNextEdge origin: current target: n) ]
		ifAbsent: [  "noop" ]
]

{ #category : #accessing }
TypInfBlockContext >> visitReturnNode: aReturnNode [
	self visitNode: aReturnNode value.
	self next: aReturnNode.
	current outAdd: (TypInfReturnEdge origin: current target: block context root)
]
