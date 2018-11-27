Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer' }
RBLiteralArrayNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ TypParametricType new
		clazz: Array;
		parameters: {(self contents collect: [ :e | e typTypeWithDiscovered: aDictionary ]) typAsType};
		yourself
]
