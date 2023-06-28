Class {
	#name : #TypInfBlockContext,
	#superclass : #TypInfInlineContext,
	#instVars : [
		'block'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfBlockContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessageNode [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfBlockContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessage block: aBlock [
	^ self new
		inlitializeSender: aContext
			state: aState
			node: aNode
			self: aType
			super: anotherType;
		initializeMessage: aMessage;
		initializeBlock: aBlock;
		yourself
]

{ #category : #accessing }
TypInfBlockContext >> initializeBlock: aBlock [
	block := aBlock
]

{ #category : #accessing }
TypInfBlockContext >> visitNode [
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
		ifTrue: [ current
				outAdd: (TypInfReturnEdge
						origin: current
						target: block context root
						type: TypUnknownType instance) ].
	returnOriginal
		ifNotNil: [ current
				outAdd: (TypInfReturnEdge
						origin: current
						target: returnOriginal
						type: CompiledMethod typAsType) ].
	nextOriginal
		ifNotNil: [ current outAdd: (TypInfNextEdge origin: current target: nextOriginal) ]
]
