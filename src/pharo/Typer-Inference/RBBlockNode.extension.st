Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfTypeRecursive [
	| visitor |
	visitor := TypInfSignalsAlwaysVisitor new.
	self acceptVisitor: visitor.
	^ BlockClosure
		typAsFunctionTypeWithResult: self body typInfType
		arguments: (self arguments collect: #typInfType)
		argumentsOptional: false
		signalsAlways: visitor signalsAlways
]
