Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfMethod [
	^ self receiver typInfType
		lookupMethod: self selector asSymbol
		arguments: (self arguments collect: #typInfType)
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfTypeRecursive [
	^ self typInfMethod result
]
