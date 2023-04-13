Class {
	#name : #TypInfInlineContext,
	#superclass : #TypInfContext,
	#instVars : [
		'arguments',
		'receiver',
		'message'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlineContext class >> node: aNode receiver: aType arguments: someNodes state: aState message: aMessageNode [

	^ self new
		  initializeNode: aNode
		  receiver: aType
		  arguments: someNodes
		  state: aState
		  message: aMessageNode;
		  yourself
]

{ #category : #'as yet unclassified' }
TypInfInlineContext class >> node: aMethodNode self: aType super: anotherType [

	self shouldNotImplement
]

{ #category : #initialization }
TypInfInlineContext >> initializeNode: aMethodNode receiver: aType arguments: someNodes state: aState message: aMessageNode [

	Halt once.
	receiver := aType.
	arguments := someNodes.
	message := aMessageNode.
	nodes := OrderedIdentityDictionary new.
	root := nodes at: aMethodNode put: aMethodNode typInfNode.
	current := root.
	state := aState copy
		         initializeSelf: aType super: aType superOrNil;
		         yourself.
	aMethodNode acceptVisitor: self.
	nodes keysAndValuesDo: [ :n :e | 
		e initialize: state.
		self outgoingAt: n put: e.
		e outgoing
			at: #next
			ifPresent: [ :s | s do: [ :f | f state: state copy ] ] ]
]

{ #category : #initialization }
TypInfInlineContext >> initializeNode: aMethodNode self: aType super: anotherType [

	self shouldNotImplement
]

{ #category : #visiting }
TypInfInlineContext >> visitMethodNode: aMethodNode [

	root incomingArguments:
		(aMethodNode arguments withIndexCollect: [ :n :i | 
			 nodes
				 at: n
				 put:
				 (TypInfInlinedLocalDefinition node: n proxy: (arguments at: i)) ]).
	self visitNode: aMethodNode body.
	aMethodNode lastIsReturn ifFalse: [ 
		self next: RBVariableNode selfNode.
		current outgoingAdd: (TypInfReturnEdge
				 origin: current
				 target: root
				 type: CompiledMethod typAsType) ].
	^ root
]
