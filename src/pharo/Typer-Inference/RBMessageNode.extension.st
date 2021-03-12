Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfArgumentType: anArgumentNode [
	self flag: 'TODO'.
	^ TypUnknownType new
]

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
		ifFalse: [ ^ TypUnknownType new ].
	^ method result
]
