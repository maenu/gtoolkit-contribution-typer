Class {
	#name : #TypInfInlinedMethodContext,
	#superclass : #TypInfMethodContext,
	#instVars : [
		'message'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfInlinedMethodContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfInlinedMethodContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessage [
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
TypInfInlinedMethodContext >> initializeMessage: aMessage [
	message := aMessage
]

{ #category : #initialization }
TypInfInlinedMethodContext >> visit [
	| home |
	root := nodes at: node put: (TypInfInlinedMethod node: node context: self).
	current := root.
	node acceptVisitor: self.
	home := self home.
	nodes
		keysAndValuesDo: [ :n :e | 
			e initialize: home state.	"parent need to be first, why though?"
			home nodes at: n put: e.	"needed to be in context run loop"
			e outgoing
				at: #next
				ifPresent: [ :s | s do: [ :f | f state: home state copy ] ] ]
]

{ #category : #visiting }
TypInfInlinedMethodContext >> visitMethodNode: aMethodNode [
	| returnOriginal nextOriginal |
	returnOriginal := message
			outgoingAt: #returnOriginal
			ifAbsent: [ message
					outgoingAt: #return
					ifPresent: [ :target | 
						message outgoingRemoveAt: #return.
						message outgoingAt: #returnOriginal put: target ]
					ifAbsent: [ nil ] ].
	nextOriginal := message
			outgoingAt: #nextOriginal
			ifAbsent: [ message
					outgoingAt: #next
					ifPresent: [ :target | 
						message outgoingRemoveAt: #next.
						message outgoingAt: #nextOriginal put: target ]
					ifAbsent: [ nil ] ].
	message outgoingAdd: (TypInfNextEdge origin: message target: root).
	current
		incomingArguments: (aMethodNode arguments
				withIndexCollect: [ :n :i | 
					nodes
						at: n
						put: (TypInfInlinedLocalDefinition
								node: n
								context: self
								proxy: (message incomingArguments at: i)) ]).
	self visitNode: aMethodNode body.
	aMethodNode lastIsReturn
		ifFalse: [ self next: RBVariableNode selfNode.
			current
				outgoingAdd: (TypInfReturnEdge
						origin: current
						target: root
						type: CompiledMethod typAsType) ].
	returnOriginal
		ifNotNil: [ current
				outgoingAdd: (TypInfReturnEdge
						origin: current
						target: returnOriginal
						type: CompiledMethod typAsType) ].
	nextOriginal
		ifNotNil: [ current outgoingAdd: (TypInfNextEdge origin: current target: nextOriginal) ].
	^ root
]
