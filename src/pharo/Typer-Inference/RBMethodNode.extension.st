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
RBMethodNode >> typInfMethodInSelf [

	^ self typInfMethodIn: self typInfContextInSelf
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfProfileIn: aContext [

	"for some reason allChildren includes duplicates, hence the asIdentitySet"

	^ (self allChildren asIdentitySet
		   select: [ :e | e children isEmpty ]
		   thenCollect: [ :e | e -> (e typInfTypeIn: aContext) ]) as:
		  IdentityDictionary
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeRecursiveIn: aContext [

	<typPraResult: 'TypType'>
	^ TypInfMethodNodeStack
		  push: self
		  during: [ 
			  | iterations maxIterations profiles newProfile signalsAlways returns |
			  iterations := 0.
			  maxIterations := 3.
			  profiles := Set new.
			  newProfile := Dictionary new.
			  [ 
			  (profiles includes: newProfile) not and: [ 
				  iterations < maxIterations ] ] whileTrue: [ 
				  iterations := iterations + 1.
				  profiles add: newProfile.
				  (self allChildren copyWithoutAll: newProfile keys , { self }) 
					  do: [ :e | aContext removeKey: e ].
				  body typInfTypeIn: aContext.
				  newProfile keys , { self } do: [ :e | aContext removeKey: e ].
				  newProfile := self typInfProfileIn: aContext ].
			  returns := (self allChildren
				              select: #isReturn
				              thenCollect: [ :e | e typInfTypeIn: aContext ]) as:
				             OrderedCollection.
			  self lastIsReturn ifFalse: [ returns add: aContext self ].
			  signalsAlways := TypInfSignalsAlwaysVisitor
				                   signalsAlwaysOf: self
				                   in: aContext.
			  CompiledMethod
				  typAsFunctionTypeWithResult: returns typAsType
				  arguments:
				  (arguments collect: [ :e | e typInfTypeIn: aContext ])
				  argumentsOptional: false
				  signalsAlways: signalsAlways ]
		  or: [ 
			  CompiledMethod
				  typAsFunctionTypeWithResult: (aContext unknown: self)
				  arguments: (arguments collect: [ :e | aContext unknown: e ])
				  argumentsOptional: false
				  signalsAlways: nil ]
]
