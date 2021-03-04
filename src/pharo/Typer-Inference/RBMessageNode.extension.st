Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfMethod [
	^ self
		propertyAt: #typInfMethod
		ifAbsentPut: [ receiver typInfType
				lookupMethod: selector asSymbol
				arguments: (arguments collect: #typInfType) ]
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfTypeRecursive [
	^ self typInfMethod result
]
