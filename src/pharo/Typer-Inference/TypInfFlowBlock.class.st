Class {
	#name : #TypInfFlowBlock,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
	#category : #'Typer-Inference-Flow'
}

{ #category : #execution }
TypInfFlowBlock >> execute [

	^ self outgoingAt: #execute
]

{ #category : #execution }
TypInfFlowBlock >> execute: aNode [

	^ self outgoingAt: #execute put: aNode
]

{ #category : #accessing }
TypInfFlowBlock >> initialValueIn: aState [

	^ BlockClosure
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments:
		  (node arguments collect: [ :e | TypUnknownType instance ])
		  argumentsOptional: false
		  signalsAlways: nil
]

{ #category : #accessing }
TypInfFlowBlock >> transfer [

	| type |
	type := BlockClosure
		        typAsFunctionTypeWithResult: (incoming
				         select: [ :e | e data = #return ]
				         thenCollect: [ :e | state at: e origin ]) typAsType
		        arguments: (self arguments collect: [ :a | state at: a ])
		        argumentsOptional: false
		        signalsAlways: nil.
	state at: self put: type
]

{ #category : #'as yet unclassified' }
TypInfFlowBlock >> typInfArgumentTypeOf: anArgumentNode in: aType [

	| i j argument parent arguments |
	self flag: 'REWRITE'.
	self typInfIsMessageArgument ifFalse: [ 
		^ self typInfNode typeUnknown ].
	i := parent arguments indexOf: self.
	j := arguments indexOf: anArgumentNode.
	argument := (parent typInfMethodIn: aType) arguments at: i.
	argument isUnion ifTrue: [ 
		argument := argument types
			            detect: #isFunction
			            ifNone: [ ^ self typInfNode typeUnknown ] ].
	(argument isFunction and: [ argument argumentsSize >= j ]) ifTrue: [ 
		^ argument arguments at: j ].
	^ self typInfNode typeUnknown
]

{ #category : #'as yet unclassified' }
TypInfFlowBlock >> typInfIsMessageArgument [

	| parent |
	self flag: 'REWRITE'.
	^ parent isNotNil and: [ 
		  parent isMessage and: [ parent arguments includes: self ] ]
]

{ #category : #visiting }
TypInfFlowBlock >> visitBlockNode: aBlockNode [

	^ BlockClosure
		  typAsFunctionTypeWithResult: (self visitNode: aBlockNode body)
		  arguments:
		  (aBlockNode arguments collect: [ :e | self visitNode: e ])
		  argumentsOptional: false
		  signalsAlways: nil
]
