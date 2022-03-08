Class {
	#name : #TypInfVariable,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfVariable >> constrain: aNode to: aType [

	node variable typInfConstrain: self node: aNode to: aType
]

{ #category : #'as yet unclassified' }
TypInfVariable >> constrainLocal: aNode to: aType [

	self constrainVariable: aNode to: aType.
	node isDefinition ifFalse: [ 
		self constrainVariable: aNode incomingRead to: aType ]
]

{ #category : #'as yet unclassified' }
TypInfVariable >> constrainLocalTo: aType [

	self constrainVariableTo: aType.
	node isDefinition ifFalse: [ 
		self incomingRead constrainLocalTo: aType ]
]

{ #category : #'as yet unclassified' }
TypInfVariable >> constrainTo: aType [

	node variable typInfConstrain: self to: aType
]

{ #category : #'as yet unclassified' }
TypInfVariable >> constrainVariable: aNode to: aType [

	super constrain: aNode to: aType
]

{ #category : #'as yet unclassified' }
TypInfVariable >> constrainVariableTo: aType [

	super constrainTo: aType
]

{ #category : #'meta-object-protocol' }
TypInfVariable >> incomingRead [

	^ self incomingAt: #read
]

{ #category : #'meta-object-protocol' }
TypInfVariable >> incomingRead: aNode [

	^ self incomingAt: #read put: aNode
]

{ #category : #accessing }
TypInfVariable >> initialize: aState [

	state := aState.
	^ node variable typInfInitialize: self
]

{ #category : #initialization }
TypInfVariable >> initializeGlobal [

	state at: self put: node value typInfType
]

{ #category : #initialization }
TypInfVariable >> initializeSelf [

	state at: self put: state self
]

{ #category : #initialization }
TypInfVariable >> initializeSuper [

	state at: self put: state super
]

{ #category : #initialization }
TypInfVariable >> initializeThisContext [

	state at: self put: Context typAsType
]

{ #category : #initialization }
TypInfVariable >> initializeVariable [

	| className global |
	(node name beginsWith: 'an')
		ifTrue: [ className := node name allButFirst: 2 ]
		ifFalse: [ 
			(node name beginsWith: 'a')
				ifTrue: [ className := node name allButFirst: 1 ]
				ifFalse: [ ^ state at: self put: TypUnknownType instance ] ].
	global := Smalltalk globals
		          at: className asSymbol
		          ifAbsent: [ ^ state at: self put: TypUnknownType instance ].
	global isClassOrTrait ifFalse: [ 
		^ state at: self put: TypUnknownType instance ].
	state at: self put: global typAsType
]

{ #category : #'as yet unclassified' }
TypInfVariable >> outgoingReads [

	^ (outgoing at: #read) collect: #target
]

{ #category : #private }
TypInfVariable >> transfer [

	node variable typInfTransfer: self
]

{ #category : #'as yet unclassified' }
TypInfVariable >> transferClass [

	| type |
	type := state at: self.
	type isUnknown ifFalse: [ ^ self ].
	type := node owningClass typAsType lookupVariable: node name asSymbol.
	state at: self put: type
]

{ #category : #'as yet unclassified' }
TypInfVariable >> transferInstance [

	| type |
	type := state at: self.
	type isUnknown ifFalse: [ ^ self ].
	type := node variable owningClass typAsType lookupVariable: node name asSymbol.
	state at: self put: type
]

{ #category : #'as yet unclassified' }
TypInfVariable >> transferLocal [

	| type |
	type := node isDefinition
		        ifTrue: [ 
		        (self outgoingReads collect: [ :e | e state at: e ])
			        typAsType ]
		        ifFalse: [ state at: self incomingRead ].
	state at: self put: type
]
