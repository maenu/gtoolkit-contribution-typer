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
		initializeSender: aContext
			state: aState
			node: aNode
			self: aType
			super: anotherType;
		initializeMessage: aMessage;
		yourself
]

{ #category : #accessing }
TypInfInlineContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ message = anObject message
]

{ #category : #accessing }
TypInfInlineContext >> canInstall [
	node compiledMethod isRealPrimitive ifTrue: [ ^ false ].
	node compiledMethod isAbstract ifTrue: [ ^ false ].
	^ self stackSize < 4
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
	sender children add: self.
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
	sender children remove: self.
	(nodes values flatCollect: #yourself) do: #uninstall.
	current := root := nil
]

{ #category : #initialization }
TypInfInlineContext >> visitNode [
	message outAdd: (TypInfNextEdge origin: message target: root).
	root
		inArguments: (node arguments
				withIndexCollect: [ :n :i | 
					self
						nextEdgeTo: (TypInfInlinedLocalDefinition
								node: n
								context: self
								proxy: (message inArguments at: i)) ]).
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
