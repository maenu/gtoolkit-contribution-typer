Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfArgumentTypeOf: anArgumentNode in: aContext [

	| i j argument |
	self typInfIsMessageArgument ifFalse: [ ^ aContext unknown: self ].
	i := parent arguments indexOf: self.
	j := arguments indexOf: anArgumentNode.
	argument := (parent typInfMethodIn: aContext) arguments at: i.
	argument isUnion ifTrue: [ 
		argument := argument types
			            detect: #isFunction
			            ifNone: [ ^ aContext unknown: self ] ].
	(argument isFunction and: [ argument argumentsSize >= j ]) ifTrue: [ 
		^ argument arguments at: j ].
	^ aContext unknown: self
]

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfTypeRecursiveIn: aContext [

	^ BlockClosure
		  typAsFunctionTypeWithResult: (body typInfTypeIn: aContext)
		  arguments: (arguments collect: [ :e | e typInfTypeIn: aContext ])
		  argumentsOptional: false
		  signalsAlways:
		  (TypInfSignalsAlwaysVisitor signalsAlwaysOf: self in: aContext)
]
