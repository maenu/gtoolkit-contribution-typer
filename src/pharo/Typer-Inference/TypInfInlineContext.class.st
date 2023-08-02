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
TypInfInlineContext >> canInstall [
	node compiledMethod isRealPrimitive ifTrue: [ ^ false ].
	node compiledMethod isAbstract ifTrue: [ ^ false ].
	^ message methodNestingLevel < 4
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
TypInfInlineContext >> install [
	self visit
]

{ #category : #accessing }
TypInfInlineContext >> message [
	^ message
]

{ #category : #accessing }
TypInfInlineContext >> newRoot [
	^ TypInfInlinedMethod node: node context: self
]

{ #category : #accessing }
TypInfInlineContext >> uninstall [
	| home |
	home := self home.
	nodes
		keysAndValuesDo: [ :n :c | 
			c
				do: [ :e | 
					(e isKindOf: TypInfMessage) ifTrue: [ e uninstall ].
					home nodesAt: n remove: e ] ].
	message
		outAt: #nextOriginal
		ifPresent: [ :n | 
			message
				outRemoveAt: #next;
				outAdd: (TypInfNextEdge origin: message target: n) ]
		ifAbsent: [  "noop" ]
]

{ #category : #initialization }
TypInfInlineContext >> visit [
	| home |
	root := self newRoot.
	self nodesAt: node add: root.
	current := root.
	self visitNode.
	home := self home.
	nodes
		keysAndValuesDo: [ :n :c | 
			c
				do: [ :e | 
					e initialize: home state.
					home nodesAt: n add: e.	"needed to be in context run loop"
					home nodes values
						do: [ :cc | 
							cc
								do: [ :nn | 
									nn state at: e put: TypUnknownType instance.
									nn burp ] ] ] ]
]

{ #category : #initialization }
TypInfInlineContext >> visitNode [
	message outAdd: (TypInfNextEdge origin: message target: root).
	root
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
	node pragmas do: [ :p | self visitNode: p ].
	self visitNode: node body.
	node lastIsReturn
		ifFalse: [ self next: RBVariableNode selfNode.
			current outAdd: (TypInfReturnEdge origin: current target: root) ].
	message
		outAt: #nextOriginal
		ifPresent: [ :n | current outAdd: (TypInfNextEdge origin: current target: n) ]
		ifAbsent: [  "noop" ]
]
