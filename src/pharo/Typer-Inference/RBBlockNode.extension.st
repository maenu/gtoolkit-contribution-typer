Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfArgumentTypeOf: anArgumentNode in: aType [

	| i j argument |
	self flag: 'REMOVE'.
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

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfFlow [

	^ TypInfFlowBlock node: self
]
