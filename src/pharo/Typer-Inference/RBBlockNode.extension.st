Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfArgumentType: anArgumentNode [
	| i j method argument |
	self typIsArgument
		ifFalse: [ ^ TypUnknownType new ].
	i := parent arguments indexOf: self.
	j := arguments indexOf: anArgumentNode.
	method := parent typInfMethod.
	argument := method arguments at: i.
	argument isFunction
		ifTrue: [ ^ argument arguments at: j ].
	argument isUnion
		ifTrue: [ argument types
				detect: #isFunction
				ifFound: [ :e | ^ e arguments at: j ] ].
	^ TypUnknownType new
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
RBBlockNode >> typIsArgument [
	^ parent isMessage and: [ parent arguments includes: self ]
]
