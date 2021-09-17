Extension { #name : 'RBBlockNode' }

{ #category : '*Typer-Inference' }
RBBlockNode >> typInfArgumentType: anArgumentNode [

	| i j argument |
	self typIsMessageArgument ifFalse: [ ^ self typInfUnknown ].
	i := parent arguments indexOf: self.
	j := arguments indexOf: anArgumentNode.
	argument := parent typInfMethod arguments at: i.
	argument isUnion ifTrue: [ 
		argument := argument types
			            detect: #isFunction
			            ifNone: [ ^ self typInfUnknown ] ].
	(argument isFunction and: [ argument argumentsSize >= j ]) ifTrue: [ 
		^ argument arguments at: j ].
	^ self typInfUnknown
]

{ #category : '*Typer-Inference' }
RBBlockNode >> typInfTypeRecursive [
	| visitor |
	visitor := TypInfSignalsAlwaysVisitor new.
	self acceptVisitor: visitor.
	^ BlockClosure
		typAsFunctionTypeWithResult: body typInfType
		arguments: (arguments collect: #typInfType)
		argumentsOptional: false
		signalsAlways: visitor signalsAlways
]

{ #category : '*Typer-Inference' }
RBBlockNode >> typIsMessageArgument [
	^ parent isMessage and: [ parent arguments includes: self ]
]
