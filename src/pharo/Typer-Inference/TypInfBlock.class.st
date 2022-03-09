Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

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

{ #category : #'as yet unclassified' }
TypInfBlock >> set: aType in: aState [

	| arguments |
	super set: aType in: aState.
	arguments := aType arguments.
	self incomingArguments withIndexDo: [ :n :i | 
		i <= arguments size ifTrue: [ 
			n setCovariant: (arguments at: i) in: aState ] ].
	self incomingReturnBlock setContravariant: aType result in: aState
]

{ #category : #accessing }
TypInfBlock >> transfer [

	| type |
	type := BlockClosure
		        typAsFunctionTypeWithResult:
		        (state at: self incomingReturnBlock)
		        arguments:
		        (self incomingArguments collect: [ :a | state at: a ])
		        argumentsOptional: false
		        signalsAlways: nil.
	self set: type in: state
]
