Class {
	#name : #TypInfInlContext,
	#superclass : #TypInfContext,
	#instVars : [
		'message'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlContext class >> sender: aContext state: aState node: aNode lookup: aLookup [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfInlContext class >> sender: aContext state: aState node: aNode lookup: aLookup message: aMessage [
	^ (super
		sender: aContext
		state: aState
		node: aNode
		lookup: aLookup)
		initializeMessage: aMessage;
		yourself
]

{ #category : #accessing }
TypInfInlContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	message = anObject message ifFalse: [ ^ false ].
	^ true
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
TypInfInlContext >> initializeMessage: aMessage [
	message := aMessage
]

{ #category : #initialization }
TypInfInlContext >> install [
	self assert: [ root isNil ].
	self assert: [ current isNil ].
	sender children add: self.
	current := root := self add: (TypInfInlMethod node: node context: self).
	nodeStackDepth := self stackSize.
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
			current outAdd: (TypInfReturnEdge origin: current target: root).
			message outNextDisabledsEnableOn: current ]
]

{ #category : #accessing }
TypInfInlContext >> isInstalled [
	^ root isNotNil
]

{ #category : #accessing }
TypInfInlContext >> message [
	^ message
]

{ #category : #accessing }
TypInfInlContext >> uninstall [
	sender children remove: self.
	super uninstall
]

{ #category : #accessing }
TypInfInlContext >> visitReturnNode: aReturnNode [
	self visitNode: aReturnNode value.
	current outAdd: (TypInfReturnEdge origin: current target: root).
	message outNextDisabledsEnableOn: current
]
