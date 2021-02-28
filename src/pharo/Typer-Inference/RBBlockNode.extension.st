Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfResult [
	<typTypeResultAs: 'TypType'>
	^ ((self typInfType) "typCastAs TypFunctionType") result
]

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfTypeRecursive [
	^ BlockClosure
		typAsFunctionTypeWithResult: self body typInfType
		arguments: (self arguments collect: #typInfType)
		argumentsOptional: false
		signalsAlways: self body typInfSignalsAlways
]
