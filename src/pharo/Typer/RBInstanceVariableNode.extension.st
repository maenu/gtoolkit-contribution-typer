Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer' }
RBInstanceVariableNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary
		at: self
		ifAbsentPut: [ | type |
			type := self methodNode methodClass typAsType.
			TypVariableResolvers instance typeForVariable: type -> name ]
]
