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
	| method |
	method := self typInfMethod.
	method isFunction
		ifFalse: [ ^ TypUnknownType new
				addOrigin: (TypInfNodeOrigin node: self);
				yourself ].
	^ method result
]
