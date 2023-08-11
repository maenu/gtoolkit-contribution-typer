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
	^ message methodNestingLevel < 8
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
	"self home root contextNodesEqualsNextNodes."
	Transcript
		nextPutAll: 'install ';
		nextPutAll: node asString lines first;
		cr.
	self visit.
	"self home root contextNodesEqualsNextNodes"
]

{ #category : #accessing }
TypInfInlineContext >> message [
	^ message
]

{ #category : #accessing }
TypInfInlineContext >> newRoot [
	| next |
	next := TypInfInlinedMethod node: node context: self.
	nodes
		at: node
		ifPresent: [ :c | c add: next ]
		ifAbsentPut: [ OrderedCollection with: next ].
	^ next
]

{ #category : #accessing }
TypInfInlineContext >> uninstall [
	root uninstall.
	current := root := nil
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
					nodes
						at: n
						ifPresent: [ :c | c add: next ]
						ifAbsent: [ nodes at: n put: (OrderedCollection with: next) ].
					current outAdd: (TypInfNextEdge origin: current target: next).
					current := next ]).
	node pragmas do: [ :p | self visitNode: p ].
	self visitNode: node body.
	node lastIsReturn
		ifFalse: [ self next: RBVariableNode selfNode.
			current outAdd: (TypInfReturnEdge origin: current target: root) ].
	current
		outAdd: (TypInfNextEdge origin: current target: (message outAt: #nextOriginal))
]
