Class {
	#name : #TypInfInlLookupContext,
	#superclass : #TypInfInlContext,
	#instVars : [
		'lookup'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlLookupContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessage [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfInlLookupContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType message: aMessage lookup: aLookup [
	^ self new
		initializeSender: aContext
			state: aState
			node: aNode
			self: aType
			super: anotherType;
		initializeMessage: aMessage;
		initializeLookup: aLookup;
		yourself
]

{ #category : #accessing }
TypInfInlLookupContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ lookup = anObject lookup
]

{ #category : #accessing }
TypInfInlLookupContext >> hash [
	^ super hash bitXor: lookup hash
]

{ #category : #accessing }
TypInfInlLookupContext >> initializeLookup: aLookup [
	lookup := aLookup
]

{ #category : #testing }
TypInfInlLookupContext >> install [
	self assert: [ root isNil ].
	self assert: [ current isNil ].
	sender children add: self.
	current := root := self add: (TypInfInlLookupMessage node: node context: self).
	message outAdd: (TypInfNextEdge origin: message target: root).
	root
		inReceiver: message inReceiver;
		inArguments: message inArguments.
	message outEnableOrigin: root
]

{ #category : #'as yet unclassified' }
TypInfInlLookupContext >> lookup [
	^ lookup
]

{ #category : #testing }
TypInfInlLookupContext >> stackSize [
	^ sender stackSize
]
