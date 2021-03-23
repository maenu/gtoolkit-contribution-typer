Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfArgumentType: anArgumentNode [
	| i j method argument |
	self typIsMessageArgument
		ifFalse: [ ^ TypUnknownType new
				addOrigin: (TypInfNodeOrigin node: self);
				yourself ].
	i := parent arguments indexOf: self.
	j := arguments indexOf: anArgumentNode.
	method := parent typInfMethod.
	method isFunction
		ifFalse: [ ^ TypUnknownType new
				addOrigin: (TypInfNodeOrigin node: self);
				yourself ].
	argument := method arguments at: i.
	argument isFunction
		ifTrue: [ ^ argument arguments at: j ].
	argument isUnion
		ifTrue: [ argument types
				detect: #isFunction
				ifFound: [ :e | ^ e arguments at: j ] ].
	^ TypUnknownType new
		addOrigin: (TypInfNodeOrigin node: self);
		yourself
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
