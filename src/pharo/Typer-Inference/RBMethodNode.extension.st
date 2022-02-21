Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfArgumentTypeOf: anArgumentNode in: aContext [

	| i |
	self flag: 'REMOVE'.
	i := arguments detectIndex: [ :e | e == anArgumentNode ].
	^ (self typInfMethodIn: aContext) arguments at: i
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfFlow [

	^ TypInfFlowMethod node: self
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfMethodIn: aType [

	self flag: 'REMOVE'.
	^ aType
		  lookupMethod: selector value asSymbol
		  arguments: (arguments collect: [ :e | e typInfTypeIn: aType ])
]
