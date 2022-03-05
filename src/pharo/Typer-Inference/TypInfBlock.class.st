Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfBlock >> constrainTo: aType [

	| type |
	type := aType.
	aType isUnion ifTrue: [ 
		aType types
			detect: #isFunction
			ifFound: [ :t | type := t ]
			ifNone: [ ^ super constrainTo: aType ] ].
	type isFunction ifFalse: [ ^ super constrainTo: aType ].
	self arguments withIndexDo: [ :n :i | 
		i <= type arguments size ifTrue: [ 
			self constrain: n to: (type arguments at: i) ] ].
	self
		incomingAt: #returnBlock
		ifPresent: [ :r | self constrain: r to: type result ]
		ifAbsent: [ "noop" ].
	^ state at: self
]

{ #category : #execution }
TypInfBlock >> execute [

	^ self outgoingAt: #execute
]

{ #category : #execution }
TypInfBlock >> execute: aNode [

	^ self outgoingAt: #execute put: aNode
]

{ #category : #accessing }
TypInfBlock >> initialize: aState [

	state := aState.
	^ state at: self put: (BlockClosure
			 typAsFunctionTypeWithResult: TypUnknownType instance
			 arguments:
			 (node arguments collect: [ :e | TypUnknownType instance ])
			 argumentsOptional: false
			 signalsAlways: nil)
]

{ #category : #accessing }
TypInfBlock >> transfer [

	| type |
	type := BlockClosure
		        typAsFunctionTypeWithResult:
			        ((incoming at: #returnBlock) collect: [ :e | 
				         state at: e origin ]) typAsType
		        arguments: (self arguments collect: [ :a | state at: a ])
		        argumentsOptional: false
		        signalsAlways: nil.
	state at: self put: type
]
