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
	| home node_ |
	node_ := TypInfInlinedMethod node: node context: self.
	root := nodes at: node_ put: node_.
	current := root.
	self visitNode.
	home := self home.
	nodes
		keysAndValuesDo: [ :n :e | 
			e initialize: home state.	"parent need to be first, why though?"
			home nodes at: n put: e.	"needed to be in context run loop"
			e out
				at: #next
				ifPresent: [ :s | s do: [ :f | f state: home state copy ] ] ]
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
					nodes
						at: n
						put: (TypInfInlinedLocalDefinition
								node: n
								context: self
								proxy: (message inArguments at: i)) ]).
	self visitNode: node body.
	node lastIsReturn
		ifFalse: [ self next: RBVariableNode selfNode.
			current
				outAdd: (TypInfReturnEdge
						origin: current
						target: root
						type: CompiledMethod typAsType) ].
	returnOriginal
		ifNotNil: [ current
				outAdd: (TypInfReturnEdge
						origin: current
						target: returnOriginal
						type: CompiledMethod typAsType) ].
	nextOriginal
		ifNotNil: [ current outAdd: (TypInfNextEdge origin: current target: nextOriginal) ]
]
