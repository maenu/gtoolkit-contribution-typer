Class {
	#name : #TypInfBlockContext,
	#superclass : #TypInfInlContext,
	#instVars : [
		'block'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfBlockContext class >> sender: aContext state: aState node: aNode lookup: aLookup message: aMessageNode [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfBlockContext class >> sender: aContext state: aState node: aNode lookup: aLookup message: aMessage block: aBlock [
	^ (super
		sender: aContext
		state: aState
		node: aNode
		lookup: aLookup
		message: aMessage)
		initializeBlock: aBlock;
		yourself
]

{ #category : #accessing }
TypInfBlockContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ block = anObject block
]

{ #category : #accessing }
TypInfBlockContext >> block [
	^ block
]

{ #category : #accessing }
TypInfBlockContext >> definition: aLocalNode [
	nodes
		at: aLocalNode variable definingNode
		ifPresent: [ :c | 
			self assert: [ c size = 1 ].
			^ c anyOne ].
	^ block context definition: aLocalNode
]

{ #category : #accessing }
TypInfBlockContext >> hash [
	^ super hash bitXor: block hash
]

{ #category : #accessing }
TypInfBlockContext >> home [
	^ block context home
]

{ #category : #accessing }
TypInfBlockContext >> initializeBlock: aBlock [
	block := aBlock
]

{ #category : #accessing }
TypInfBlockContext >> install [
	self assert: [ root isNil ].
	self assert: [ current isNil ].
	sender children add: self.
	current := root := self add: (TypInfInlBlock node: node context: self).
	message outAdd: (TypInfNextEdge origin: message target: root).
	root
		outAt: #definition put: block;
		inArguments: (node arguments
				withIndexCollect: [ :n :i | 
					i <= message inArguments size
						ifTrue: [ self
								nextEdgeTo: (TypInfInlLocalDefinition
										node: n
										context: self
										proxy: (message inArguments at: i)) ]
						ifFalse: [ self next: n	"can happen for function receiver types" ] ]).
	self visitNode: node body.
	node body lastIsReturn
		ifFalse: [ current outAdd: (TypInfReturnEdge origin: current target: root).
			message outNextDisableds
				do: [ :e | (self returns: e target context) ifFalse: [ e enableOrigin: current ] ] ]
]

{ #category : #accessing }
TypInfBlockContext >> self [
	^ block context self
]

{ #category : #accessing }
TypInfBlockContext >> stackSize [
	^ sender stackSize
]

{ #category : #accessing }
TypInfBlockContext >> super [
	^ block context super
]

{ #category : #accessing }
TypInfBlockContext >> uninstall [
	root outRemoveAt: #definition.
	super uninstall
]

{ #category : #accessing }
TypInfBlockContext >> visitReturnNode: aReturnNode [
	self visitNode: aReturnNode value.
	current
		outAdd: (TypInfReturnEdge
				origin: current
				target: (self home nodesAt: block node withAllParents first) first)
]
