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
		incomingArguments: (node arguments
				withIndexCollect: [ :n :i | 
					nodes
						at: n
						put: (TypInfInlinedLocalDefinition
								node: n
								context: self
								proxy: (message incomingArguments at: i)) ]).
	self visitNode: node body.
	node lastIsReturn
		ifTrue: [ current
				outgoingAdd: (TypInfReturnEdge
						origin: current
						target: block context root
						type: TypUnknownType instance) ].
	returnOriginal
		ifNotNil: [ current
				outgoingAdd: (TypInfReturnEdge
						origin: current
						target: returnOriginal
						type: CompiledMethod typAsType) ].
	nextOriginal
		ifNotNil: [ current outgoingAdd: (TypInfNextEdge origin: current target: nextOriginal) ]
]
