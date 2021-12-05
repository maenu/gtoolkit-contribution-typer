Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfArgumentTypeOf: anArgumentNode in: aContext [

	| i |
	i := arguments detectIndex: [ :e | e == anArgumentNode ].
	^ (self typInfMethodIn: aContext) arguments at: i
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfMethodIn: aContext [

	^ aContext self
		  lookupMethod: selector value asSymbol
		  arguments: (arguments collect: [ :e | e typInfTypeIn: aContext ])
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeInSelf [

	^ self typInfTypeIn:
		  (TypInfAstContext self: self methodClass typAsType)
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeRecursiveIn: aContext [

	<typPraResult: 'TypType'>
	self
		assert: [ TypInfMethodNodeStack value isNotNil ]
		description:
		'use TypInfMethodNodeStack during: [ aMethod typInfTypeSelf ]'.
	(TypInfMethodNodeStack includes: self) ifTrue: [ 
		^ CompiledMethod
			  typAsFunctionTypeWithResult: (aContext unknown: self)
			  arguments: (arguments collect: [ :e | aContext unknown: self ])
			  argumentsOptional: false
			  signalsAlways: nil ].
	TypInfMethodNodeStack push: self during: [ 
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
			  (TypInfSignalsAlwaysVisitor signalsAlwaysOf: self in: aContext) ]
]
