Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer' }
RBLiteralArrayNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary
		at: self
		ifAbsentPut: [ TypParametricType new
				clazz: Array;
				parameters: {(self contents collect: [ :e | e typTypeWithDiscovered: aDictionary ]) typAsType};
				yourself ]
]
