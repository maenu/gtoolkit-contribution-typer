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

{ #category : #'as yet unclassified' }
TypInfInlineContext >> initializeMessage: aMessage [
	message := aMessage
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
	| returnOriginal nextOriginal |
	returnOriginal := message
			outAt: #returnOriginal
			ifAbsent: [ message
					outAt: #return
					ifPresent: [ :target | 
						message outRemoveAt: #return.
						message outAt: #returnOriginal put: target ]
					ifAbsent: [ nil ] ].
	nextOriginal := message
			outAt: #nextOriginal
			ifAbsent: [ message
					outAt: #next
					ifPresent: [ :target | 
						message outRemoveAt: #next.
						message outAt: #nextOriginal put: target ]
					ifAbsent: [ nil ] ].
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
	returnOriginal
		ifNotNil: [ current outAdd: (TypInfReturnEdge origin: current target: returnOriginal) ].
	nextOriginal
		ifNotNil: [ current outAdd: (TypInfNextEdge origin: current target: nextOriginal) ]
]
