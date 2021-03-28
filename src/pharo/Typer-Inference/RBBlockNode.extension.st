Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfArgumentType: anArgumentNode [
	| i j argument |
	self typIsMessageArgument
		ifFalse: [ ^ self typInfUnknown ].
	i := parent arguments indexOf: self.
	j := arguments indexOf: anArgumentNode.
	argument := parent typInfMethod arguments at: i.
	argument isFunction
		ifFalse: [ ^ self typInfUnknown ].
	^ argument arguments at: j
]

{ #category : #'*Typer-Inference' }
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

{ #category : #'*Typer-Inference' }
RBBlockNode >> typIsMessageArgument [
	^ parent isMessage and: [ parent arguments includes: self ]
]
