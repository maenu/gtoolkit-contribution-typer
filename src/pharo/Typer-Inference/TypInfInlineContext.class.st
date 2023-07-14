Class {
	#name : #TypInfInlineContext,
	#superclass : #TypInfContext,
	#instVars : [
		'message'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfInlineContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfInlineContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessage [
	^ self new
		inlitializeSender: aContext
			state: aState
			node: aNode
			self: aType
			super: anotherType;
		initializeMessage: aMessage;
		yourself
]

{ #category : #accessing }
TypInfInlineContext >> = anObject [
	super = anObject ifFalse: [ ^ false ].
	^ message = anObject message
]

{ #category : #accessing }
TypInfInlineContext >> apply [
	TypInfMethodNodeStack
		push: node
		max: 8
		during: [ self visit ]
		or: [ Error signal: 'cannot inline due to method stack limit' ]
]

{ #category : #accessing }
TypInfInlineContext >> hash [
	^ super hash bitXor: message hash
]

{ #category : #accessing }
TypInfInlineContext >> initializeMessage: aMessage [
	message := aMessage
]

{ #category : #accessing }
TypInfInlineContext >> message [
	^ message
]

{ #category : #accessing }
TypInfInlineContext >> revert [
	| home |
	home := self home.
	nodes keysAndValuesDo: [ :n :c | c do: [ :e | home nodesAt: n remove: e ] ].
	message
		outAdd: (TypInfNextEdge origin: message target: (current outRemoveAt: #next))
]

{ #category : #initialization }
TypInfInlineContext >> visit [
	| home |
	root := TypInfInlinedMethod node: node context: self.
	self flag: 'Q is key really root? could be node too...'.
	self nodesAt: root add: root.
	current := root.
	self visitNode.
	home := self home.
	nodes
		keysAndValuesDo: [ :n :c | 
			c
				do: [ :e | 
					e initialize: home state.
					home nodesAt: n add: e	"needed to be in context run loop" ] ]
]

{ #category : #initialization }
TypInfInlineContext >> visitNode [
	message outAdd: (TypInfNextEdge origin: message target: root).
	current
		inArguments: (node arguments
				withIndexCollect: [ :n :i | 
					self
						nodesAt: n
						add: (TypInfInlinedLocalDefinition
								node: n
								context: self
								proxy: (message inArguments at: i)) ]).
	self visitNode: node body.
	node lastIsReturn
		ifFalse: [ self next: RBVariableNode selfNode.
			current outAdd: (TypInfReturnEdge origin: current target: root) ].
	current
		outAdd: (TypInfNextEdge origin: current target: (message outAt: #nextOriginal))
]
