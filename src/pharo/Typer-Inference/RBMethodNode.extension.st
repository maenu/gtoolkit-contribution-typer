Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfArgumentTypeOf: anArgumentNode in: aContext [

	| i |
	i := arguments detectIndex: [ :e | e == anArgumentNode ].
	^ (self typInfMethodIn: aContext) arguments at: i
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfMethodIn: aContext [

	<typPraResult: 'TypFunctionType'>
	^ aContext methodAt: self ifAbsentPut: [ 
		  aContext self
			  lookupMethod: selector asSymbol
			  arguments: (arguments collect: [ :e | e typInfTypeIn: aContext ]) ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeInSelf [

	^ self typInfTypeIn:
		  (TypInfAstContext self: self methodClass typAsType)
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeRecursiveIn: aContext [

	<typPraResult: 'TypType'>
	| types |
	body typInfTypeIn: aContext.
	types := (self allChildren select: #isReturn)
		         collect: [ :e | e typInfTypeIn: aContext ]
		         as: OrderedCollection.
	self lastIsReturn ifFalse: [ types add: aContext self ].
	^ CompiledMethod
		  typAsFunctionTypeWithResult: types typAsType
		  arguments: (arguments collect: [ :e | e typInfTypeIn: aContext ])
		  argumentsOptional: false
		  signalsAlways:
		  (TypInfSignalsAlwaysVisitor signalsAlwaysOf: self in: aContext)
]
