Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfBlock >> convariantTo: aType [

	| arguments |
	arguments := aType arguments.
	self incomingArguments withIndexDo: [ :n :i | 
		i <= arguments size ifTrue: [ 
			self contravariant: n to: (arguments at: i) ] ].
	self covariant: self incomingReturnBlock to: aType result
]

{ #category : #'as yet unclassified' }
TypInfBlock >> incomingReturnBlock [

	^ self incomingAt: #returnBlock
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

{ #category : #execution }
TypInfBlock >> ougoingExecute [

	^ self outgoingAt: #execute
]

{ #category : #execution }
TypInfBlock >> ougoingExecute: aNode [

	^ self outgoingAt: #execute put: aNode
]

{ #category : #accessing }
TypInfBlock >> transfer [

	"(state at: self) isUnknown ifFalse: [ ^ self ]."
	state at: self put: (BlockClosure
			 typAsFunctionTypeWithResult: (state at: self incomingReturnBlock)
			 arguments: (self incomingArguments collect: [ :a | state at: a ])
			 argumentsOptional: false
			 signalsAlways: nil)
]
