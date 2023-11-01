Class {
	#name : #TypInfInlContext,
	#superclass : #TypInfContext,
	#instVars : [
		'message',
		'lookup'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfInlContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfInlContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType lookup: aLookup message: aMessage [
	^ (super
		sender: aContext
		state: aState
		node: aNode
		self: aType
		super: anotherType)
		initializeLookup: aLookup message: aMessage;
		yourself
]

{ #category : #accessing }
TypInfInlContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	message = anObject message ifFalse: [ ^ false ].
	^ lookup = anObject lookup
]

{ #category : #accessing }
TypInfInlContext >> adoptSelf: aType super: anotherTypeOrNil [
	selfType := aType.
	superType := anotherTypeOrNil.
	message contexts rehash
]

{ #category : #accessing }
TypInfInlContext >> canInstall [
	^ true
]

{ #category : #accessing }
TypInfInlContext >> hash [
	^ (super hash bitXor: message hash) bitXor: lookup hash
]

{ #category : #accessing }
TypInfInlContext >> initializeLookup: aLookup message: aMessage [
	self assert: [ aLookup isKindOf: TypLookup ].
	self assert: [ aMessage isKindOf: TypInfMessage ].
	lookup := aLookup.
	message := aMessage
]

{ #category : #initialization }
TypInfInlContext >> install [
	self assert: [ root isNil ].
	self assert: [ current isNil ].
	sender children add: self.
	current := root := self add: (TypInfInlMethod node: node context: self).
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
	node body lastIsReturn
		ifFalse: [ self next: RBVariableNode selfNode.
			current outAdd: (TypInfReturnEdge origin: current target: root) ].
	message outNextDisableds
		do: [ :e | (self returns: e target context) ifFalse: [ e enableOrigin: current ] ]
]

{ #category : #accessing }
TypInfInlContext >> lookup [
	^ lookup
]

{ #category : #accessing }
TypInfInlContext >> message [
	^ message
]

{ #category : #accessing }
TypInfInlContext >> uninstall [
	sender children remove: self.
	(nodes values flatCollect: #yourself) do: #uninstall.
	current := root := nil
]
