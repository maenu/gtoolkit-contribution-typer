Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfArgumentType: anArgumentNode self: aType [

	| i j argument |
	self typInfIsMessageArgument ifFalse: [ 
		^ self typInfUnknownSelf: aType ].
	i := parent arguments indexOf: self.
	j := arguments indexOf: anArgumentNode.
	argument := (parent typInfMethodSelf: aType) arguments at: i.
	argument isUnion ifTrue: [ 
		argument := argument types
			            detect: #isFunction
			            ifNone: [ ^ self typInfUnknownSelf: aType ] ].
	(argument isFunction and: [ argument argumentsSize >= j ]) ifTrue: [ 
		^ argument arguments at: j ].
	^ self typInfUnknownSelf: aType
]

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfIsMessageArgument [
	^ parent isMessage and: [ parent arguments includes: self ]
]

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfTypeRecursiveSelf: aType [

	| visitor |
	visitor := TypInfSignalsAlwaysVisitor new.
	self acceptVisitor: visitor.
	^ BlockClosure
		  typAsFunctionTypeWithResult: (body typInfTypeSelf: aType)
		  arguments: (arguments collect: [ :e | e typInfTypeSelf: aType ])
		  argumentsOptional: false
		  signalsAlways: visitor signalsAlways
]
