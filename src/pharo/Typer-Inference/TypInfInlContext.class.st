Class {
	#name : #TypInfInlContext,
	#superclass : #TypInfContext,
	#instVars : [
		'message'
	],
	#category : #'Typer-Inference-Inline'
}

{ #category : #'as yet unclassified' }
TypInfInlContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfInlContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessage [
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
TypInfInlContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ message = anObject message
]

{ #category : #accessing }
TypInfInlContext >> canInstall [
	node compiledMethod isRealPrimitive ifTrue: [ ^ false ].
	node compiledMethod isAbstract ifTrue: [ ^ false ].
	^ self stackSize < 4
]

{ #category : #accessing }
TypInfInlContext >> hash [
	^ super hash bitXor: message hash
]

{ #category : #accessing }
TypInfInlContext >> initializeMessage: aMessage [
	self assert: [ aMessage isKindOf: TypInfMessage ].
	message := aMessage
]

{ #category : #accessing }
TypInfInlContext >> install [
	sender children add: self.
	self visit
]

{ #category : #accessing }
TypInfInlContext >> message [
	^ message
]

{ #category : #accessing }
TypInfInlContext >> newRoot [
	^ TypInfInlMethod node: node context: self
]

{ #category : #accessing }
TypInfInlContext >> uninstall [
	sender children remove: self.
	(nodes values flatCollect: #yourself) do: #uninstall.
	current := root := nil
]

{ #category : #initialization }
TypInfInlContext >> visitNode [
	message outAdd: (TypInfNextEdge origin: message target: root).
	root
		inArguments: (node arguments
				withIndexCollect: [ :n :i | 
					self
						nextEdgeTo: (TypInfInlLocalDefinition
								node: n
								context: self
								proxy: (message inArguments at: i)) ]).
	node pragmas do: [ :p | self visitNode: p ].
	self visitNode: node body.
	node lastIsReturn
		ifFalse: [ current outAdd: (TypInfSelfReturnEdge origin: current target: root) ].
	(message outDisableds: #next)
		do: [ :e | (self returns: e target context) ifFalse: [ e enableOrigin: current ] ].
	message
		outEnable: #return origin: current;
		outEnable: #signal origin: current
]
